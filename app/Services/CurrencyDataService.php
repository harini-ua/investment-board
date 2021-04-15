<?php

namespace App\Services;

use App\Models\Currency;
use App\Models\User;
use Illuminate\Support\Collection;

class CurrencyDataService extends DataServiceAbstract
{
    /** @var string  */
    protected $valuationMethod;

    /** @var string  */
    protected $valuationDate;

    /** @var string  */
    protected $custodian;

    /** @var string  */
    protected $account;

    /** @var Collection */
    protected $exposureData;

    /** @var string  */
    protected $chosen;

    public function init(User $user, array $data)
    {
        $this->user = $user;
        $this->clientCode = $user->client_code;
        $this->valuationMethod= $data['method'] ?? null;
        $this->valuationDate = $data['date'] ?? null;
        $this->baseCurrency = $user->base_currency;
        $this->custodian = $data['custodian'] ?? null;
        $this->account = $data['account'] ?? null;
        $this->chosen = $data['chosen'] ?? null;

        $this->setFilters();
    }

    public function exposureData()
    {
        $results = Currency::data(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
            $this->user->base_currency,
            $this->custodian,
            $this->account
        );

        $currency = [];
        foreach ($results as $item) {
            $currency[$item->currency][strtolower($item->category)] = $item->value;
        }

        $currencyExposureData = [];
        $i = 0;
        foreach ($currency as $key => $item) {
            $currencyExposureData[$i] = [
                'currency' => $key,
                'cash' => $item['cash'] ?? null,
                'fx' => $item['fx'] ?? null,
                'investment' => $item['investment'] ?? null,
            ];

            $currencyExposureData[$i]['total'] =
                $currencyExposureData[$i]['cash'] +
                $currencyExposureData[$i]['fx'] +
                $currencyExposureData[$i]['investment'];

            $currencyExposureData[$i]['active'] = false;
            $currencyExposureData[$i]['grant_total'] = false;

            $i++;
        }

        $this->exposureData = $currencyExposureData;

        $currencyExposureData[] = [
            'currency' => 'Total',
            'fx' => collect($currencyExposureData)->sum('fx'),
            'cash' => collect($currencyExposureData)->sum('cash'),
            'investment' => collect($currencyExposureData)->sum('investment'),
            'total' => collect($currencyExposureData)->sum('total'),
            'grant_total' => true,
            'active' => false,
        ];

        return $currencyExposureData;
    }

    public function exposureCart()
    {
        $currencyExposureCart = [];
        foreach ($this->exposureData as $key => $item) {
            $currencyExposureCart[] = [
                'currency' => $item['currency'],
                'percentage' => round($item['total'] / collect($this->exposureData)->sum('total') * 100, 1)
            ];
        }

        return $currencyExposureCart;
    }


    public function hedging()
    {
        $currencyHedging = [];
        foreach ($this->exposureData as $key => $currencyExposure) {
            $currencyHedging[] = [
                'currency' => $currencyExposure['currency'],
                'gross_assets' => (($currencyExposure['cash'] + $currencyExposure['investment']) / (
                            collect($this->exposureData)->sum('cash') + collect($this->exposureData)->sum('investment')
                        )) * 100,
                'fx' => ($currencyExposure['fx'] / (
                            collect($this->exposureData)->sum('cash') + collect($this->exposureData)->sum('investment')
                        )) * 100,
                'net_assets' => ($currencyExposure['total'] / collect($this->exposureData)->sum('total')) * 100,
                'active' => false,
                'total' => false,
            ];
        }

        $currencyHedging[] = [
            'currency' => 'Total',
            'gross_assets' => collect($currencyHedging)->sum('gross_assets'),
            'fx' => collect($currencyHedging)->sum('fx'),
            'net_assets' => collect($currencyHedging)->sum('net_assets'),
            'active' => false,
            'total' => true,
        ];

        return $currencyHedging;
    }

    protected function setFilters()
    {
        $this->setValuationMethod();
        $this->setValuationDate();
        $this->setValuationCurrency();
        $this->setCustodian();
        $this->setAccount();
    }

    protected function setValuationMethod()
    {
        $results = Currency::data(
            $this->user->client_code,
            null,
            null,
            $this->user->base_currency,
            null,
            null
        );

        $this->collection = $results;
        $methods = $this->filters['method'] = $this->getValuationMethod();

        if (!$this->valuationMethod) {
            $this->valuationMethod = $methods[0]['code'];
        }
    }

    protected function setValuationDate()
    {
        $results = Currency::data(
            $this->user->client_code,
            $this->valuationMethod,
            null,
            $this->user->base_currency,
            null,
            null
        );

        $this->collection = $results;

        $dates = $this->getValuationDate();

        $this->filters['date'] = $dates;
        if (!$this->valuationDate) {
            $this->valuationDate =  $dates[0];
        }
    }

    protected function setValuationCurrency()
    {
        $this->filters['currency'] = $this->getValuationCurrency();
    }

    protected function setCustodian()
    {
        $results = Currency::data(
            $this->user->client_code,
            null,
            null,
            $this->user->base_currency,
            null,
            null
        );

        $this->collection = $results;
        $custodians = $this->filters['custodian'] = $this->getCustodian();

        if (!$this->custodian) {
            $this->custodian = $custodians[0]['code'];
        }
    }

    protected function setAccount()
    {
        $results = Currency::data(
            $this->user->client_code,
            null,
            null,
            $this->user->base_currency,
            $this->custodian,
            null
        );

        $this->collection = $results;
        $accounts = $this->filters['account'] = $this->getAccount();

        if (!$this->account || $this->chosen === 'custodian') {
            $this->account = $accounts[0]['code'];
        }
    }

    public function getFilter($name)
    {
        return $this->filters[$name];
    }
}