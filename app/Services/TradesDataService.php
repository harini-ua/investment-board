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

    /** @var string  */
    protected $chosen;

    public function init(User $user, array $data)
    {
        $this->user = $user;
        $this->clientCode = $user->client_code;
        $this->dateFrom = $data['from'] ?? null;
        $this->dateTo = $data['to'] ?? null;
        $this->baseCurrency = $user->base_currency;
        $this->assetClass = $data['asset_class'] ?? null;
        $this->custodian = $data['custodian'] ?? null;
        $this->account = $data['account'] ?? null;
        $this->chosen = $data['chosen'] ?? null;

        $this->setFilters();
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
            $this->account,
            true
        );

        return $trades->toArray();
    }

    protected function setFilters()
    {
        $this->setDateFrom();
        $this->setDateTo();
        $this->setValuationCurrency();
        $this->setAssetClass();
        $this->setCustodian();
        $this->setAccount();
    }

    protected function setDateFrom()
    {
        $results = Trades::data(
            $this->user->client_code,
            null,
            $this->dateTo,
            $this->user->base_currency,
            null,
            null,
            null,
        );

        $this->collection = $results;
        $from = $this->filters['from'] = $this->getDateFrom();

        if (!$this->dateFrom) {
            $this->dateFrom = array_pop($from);
        }

        if (!$this->dateTo) {
            $this->dateTo = $from[0];
        }
    }

    protected function setDateTo()
    {
        $results = Trades::data(
            $this->user->client_code,
            $this->dateFrom,
            null,
            $this->user->base_currency,
            null,
            null,
            null
        );

        $this->collection = $results;
        $this->filters['to'] = $this->getDateTo();
    }

    protected function setValuationCurrency()
    {
        $this->filters['currency'] = $this->getValuationCurrency();
    }
    protected function setAssetClass()
    {
        $results = Trades::data(
            $this->user->client_code,
            null,
            null,
            $this->user->base_currency,
            null,
            null,
            null
        );

        $this->collection = $results;
        $this->filters['asset_class'] = $this->getAssetClass();
    }

    protected function setCustodian()
    {
        $results = Trades::data(
            $this->user->client_code,
            null,
            null,
            $this->user->base_currency,
            null,
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
        $results = Trades::data(
            $this->user->client_code,
            null,
            null,
            $this->user->base_currency,
            null,
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