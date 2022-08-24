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
        $this->valuationMethod= $data['method'] ?? null;
        $this->valuationDate = $data['date'] ?? null;
        $this->valuationCurrency = $data['currency'] ?? null;
        $this->assetClass = $data['asset_class'] ?? null;
        $this->custodian = $data['custodian'] ?? null;
        $this->account = $data['account'] ?? null;
        $this->chosen = $data['chosen'] ?? null;

        $this->setFilters();
    }

    public function positionOpen()
    {
        $positionOpen = Position::open(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
            $this->valuationCurrency,
            $this->assetClass,
            $this->custodian,
            $this->account
        );

        return $positionOpen->toArray();
    }

    protected function setFilters()
    {
        $this->setValuationMethod();
        $this->setValuationDate();
        $this->setValuationCurrency();
        $this->setAssetClass();
        $this->setCustodian();
        $this->setAccount();
    }

    protected function setValuationMethod()
    {
        $results = Position::open(
            $this->user->client_code,
            null,
            null,
            $this->valuationCurrency
        );

        $this->collection = $results;
        $methods = $this->filters['method'] = $this->getValuationMethod();

        if (!$this->valuationMethod) {
            $this->valuationMethod = $methods[0]['code'];
        }
    }

    protected function setValuationDate()
    {
        $results = Position::open(
            $this->user->client_code,
            $this->valuationMethod,
            null,
            $this->valuationCurrency
        );

        $this->collection = $results;

        $dates = $this->getValuationDate();

        $this->filters['date'] = $dates;
        if (!$this->valuationDate) {
            $this->valuationDate = $dates[0];
        }
    }

    protected function setValuationCurrency()
    {
        $results = Position::open(
            $this->user->client_code,
            $this->valuationMethod,
            $this->valuationDate,
        );

        $this->collection = $results;
        $this->filters['currency'] = $this->getValuationCurrency('currency', false);
    }

    protected function setAssetClass()
    {
        $results = Position::open(
            $this->user->client_code,
            null,
            null,
            $this->valuationCurrency
        );

        $this->collection = $results;
        $this->filters['asset_class'] = $this->getAssetClass('asset_class');
    }

    protected function setCustodian()
    {
        $results = Position::open(
            $this->user->client_code,
            null,
            null,
            $this->valuationCurrency
        );

        $this->collection = $results;
        $custodians = $this->filters['custodian'] = $this->getCustodian();

        if (!$this->custodian) {
            $this->custodian = $custodians[0]['code'];
        }
    }

    protected function setAccount()
    {
        $results = Position::open(
            $this->user->client_code,
            null,
            null,
            $this->valuationCurrency,
            null,
            $this->custodian
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
