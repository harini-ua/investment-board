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
    protected $valuationCurrency;

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
        $this->valuationCurrency = $data['currency'] ?? null;
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
            $this->valuationCurrency,
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
            $this->valuationCurrency,
        );

        $this->collection = $results;
        $from = $this->filters['from'] = $this->getDateFrom();

        if (!$this->dateFrom) {
            $this->dateFrom = end($from);
        }

        if (!$this->dateTo) {
            reset($from);
            $this->dateTo = current($from);
        }
    }

    protected function setDateTo()
    {
        $results = Trades::data(
            $this->user->client_code,
            $this->dateFrom,
            null,
            $this->valuationCurrency,
        );

        $this->collection = $results;
        $this->filters['to'] = $this->getDateTo();
    }

    protected function setValuationCurrency()
    {
        $results = Trades::data(
            $this->user->client_code,
            $this->dateFrom,
            $this->dateTo
        );

        $this->collection = $results;
        $this->filters['currency'] = $this->getValuationCurrency('ccy', false);
    }

    protected function setAssetClass()
    {
        $results = Trades::data(
            $this->user->client_code,
            null,
            null,
            $this->valuationCurrency,
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
            $this->valuationCurrency,

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
            $this->valuationCurrency,
            null,
            $this->custodian,
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