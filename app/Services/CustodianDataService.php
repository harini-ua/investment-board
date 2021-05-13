<?php

namespace App\Services;

use App\Models\Custodian;
use App\Models\User;

class CustodianDataService extends DataServiceAbstract
{
    /** @var string  */
    protected $valuationMethod;

    /** @var string  */
    protected $valuationDate;

    /** @var string  */
    protected $valuationCurrency;

    /** @var string  */
    protected $chosen;

    public function init(User $user, array $data)
    {
        $this->user = $user;
        $this->clientCode = $user->client_code;
        $this->valuationMethod = $data['method'] ?? null;
        $this->valuationDate = $data['date'] ?? null;
        $this->valuationCurrency = $data['currency'] ?? null;
        $this->chosen = $data['chosen'] ?? null;

        $this->setFilters();
    }

    public function custodians()
    {
        $results = Custodian::data(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
            $this->valuationCurrency,
            true
        );

        $results = collect($results)->groupBy('custodian_name');

        $custodians = [];
        $i = 0;
        foreach ($results as $name => $custodian) {
            $custodians[$i] = [
                'custodian_name' => $name,
                'value' => $custodian->sum('value'),
                'total' => false,
                'active' => false,
            ];

            foreach ($custodian as $item) {
                $sum = $custodians[$i]['value'];
                $custodians[$i]['asset'][$item->kfp_asset_class] = [
                    'percentage' => round( $item->value / $sum * 100, 1),
                    'value' => $item->value,
                ];
            }
            $i++;
        }

        $custodians[] = [
            'custodian_name' => 'Total',
            'value' => collect($custodians)->sum('value'),
            'total' => true,
            'active' => false,
        ];

        return $custodians;
    }

    protected function setFilters()
    {
        $this->setValuationMethod();
        $this->setValuationDate();
        $this->setValuationCurrency();
    }

    protected function setValuationMethod()
    {
        $results = Custodian::data(
            $this->user->client_code,
        );

        $this->collection = $results;

        $methods = $this->getValuationMethod();
        $this->filters['method'] = $methods;
        if (!$this->valuationMethod) {
            $this->valuationMethod = $methods[0]['code'];
        }
    }

    protected function setValuationDate()
    {
        $results = Custodian::data(
            $this->user->client_code,
            $this->valuationMethod,
        );

        $this->collection = $results;

        $dates = $this->getValuationDate();

        $this->filters['date'] = $dates;
        if (!$this->valuationDate) {
            $this->valuationDate = $dates[0];
        }
    }

    public function setValuationCurrency()
    {
        $results = Custodian::data(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate
        );

        $this->collection = $results;

        $currency = $this->getValuationCurrency();

        $this->filters['currency'] = $currency;
        if (!$this->valuationCurrency) {
            $this->valuationCurrency = $currency[0];
        }
    }

    public function getFilter($name)
    {
        return $this->filters[$name];
    }
}