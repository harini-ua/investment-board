<?php

namespace App\Services;

use App\Models\Trades;
use App\Models\User;

class TradesDataService extends DataServiceAbstract
{
    /** @var string  */
    protected $dateFrom;

    /** @var string  */
    protected $dateTo;

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
        $this->dateFrom = $data['from'] ?? null;
        $this->dateTo = $data['to'] ?? null;
        $this->assetClass = $data['asset_class'] ?? null;
        $this->custodian = $data['custodian'] ?? null;
        $this->account = $data['account'] ?? null;
    }

    public function getTrades()
    {
        $trades = Trades::data(
            $this->user->client_code,
            $this->dateFrom,
            $this->dateTo,
            $this->user->base_currency,
            $this->assetClass,
            $this->custodian,
            $this->account
        );

        $this->collection = $trades;

        $this->setFilter();

        return $trades->toArray();
    }

    protected function setFilter()
    {
        $this->filters['from'] = $this->getValuationDateFrom();
        $this->filters['to'] = $this->getValuationDateTo();
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