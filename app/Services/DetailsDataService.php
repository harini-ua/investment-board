<?php

namespace App\Services;

use App\Models\Position;
use App\Models\User;

class DetailsDataService extends DataServiceAbstract
{
    /** @var string  */
    protected $valuationMethod;

    /** @var string  */
    protected $valuationDate;

    /** @var string  */
    protected $assetClass;

    /** @var string  */
    protected $custodian;

    /** @var string  */
    protected $account;

    public function init(User $user, array $data)
    {
        $this->user = $user;
        $this->clientCode = $user->client_code;
        $this->baseCurrency = $user->base_currency;
        $this->valuationMethod= $data['method'] ?? null;
        $this->valuationDate = $data['date'] ?? null;
        $this->assetClass = $data['asset_class'] ?? null;
        $this->custodian = $data['custodian'] ?? null;
        $this->account = $data['account'] ?? null;
    }

    public function positionOpen()
    {
        $positionOpen = Position::open(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
            $this->user->base_currency,
            $this->assetClass,
            $this->custodian,
            $this->account
        );

        $this->collection = $positionOpen;

        $this->setFilter();

        return $positionOpen->toArray();
    }

    protected function setFilter()
    {
        $this->filters['method'] = $this->getValuationMethod();
        $this->filters['date'] = $this->getValuationDate();
        $this->filters['currency'] = $this->getValuationCurrency();
        $this->filters['asset_class'] = $this->getValuationAssetClass();
        $this->filters['custodian'] = $this->getValuationcCustodian();
        $this->filters['account'] = $this->getValuationAccount();
    }

    public function getFilter($name)
    {
        return $this->filters[$name];
    }
}