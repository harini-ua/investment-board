<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

abstract class DataServiceAbstract
{
    /** @var Collection */
    protected $collection;

    /** @var User  */
    protected $user;

    /** @var string  */
    protected $clientCode;

    /** @var string  */
    protected $baseCurrency;

    /** @var array  */
    protected $filters;

    /**
     * Set initial data.
     *
     * @param User  $user
     * @param array $data
     *
     * @return mixed
     */
    abstract function init(User $user, array $data);

    /**
     * Get filter for the page.
     *
     * @param $name
     *
     * @return mixed
     */
    abstract function getFilter($name);

    /**
     * Get valuation method
     *
     * @return array
     */
    public function getValuationMethod()
    {
        $methods = array_unique($this->collection->pluck('valuation_method')->toArray());

        $results = DB::table('par_valuation_method')
            ->whereIn('value', $methods)
            ->pluck('method', 'value')
        ;

        $methods = [];
        foreach ($results as $value => $method) {
            $methods[] = [
                'code' => $value,
                'label' => $method,
            ];
        }

        return $methods;
    }

    /**
     * Get valuation date
     *
     * @return array
     */
    public function getValuationDateFrom()
    {
        return $this->collection
            ->pluck('date')
            ->unique()
            ->toArray();
    }

    /**
     * Get valuation date
     *
     * @return array
     */
    public function getValuationDateTo()
    {
        return $this->collection
            ->pluck('date')
            ->unique()
            ->toArray();
    }

    /**
     * Get valuation date
     *
     * @return array
     */
    public function getValuationDate()
    {
        return $this->collection
            ->pluck('period_date')
            ->unique()
            ->toArray();
    }

    /**
     * Get base currency
     *
     * @return array
     */
    public function getValuationCurrency()
    {
        $results = $this->user->pluck('base_currency');

        $results = $results->map(function ($value) {
            return [
                'code' => $value,
                'label' => $value,
            ];
        });

        return $results->toArray();
    }

    public function getValuationAssetClass()
    {
        $results = $this->collection
            ->sortBy('asset_class')
            ->unique('asset_class')
            ->pluck('asset_class')
        ;

        $results = $results->map(function ($value) {
            return [
                'code' => $value,
                'label' => $value,
            ];
        });

        $results = $results->toArray();
        array_unshift($results, ['code' => null, 'label' => 'All']);

        return $results;
    }

    public function getValuationcCustodian()
    {
        $results = $this->collection
            ->sortBy('custodian')
            ->unique('custodian')
            ->pluck('custodian')
        ;

        $results = $results->map(function ($value) {
            return [
                'code' => $value,
                'label' => $value,
            ];
        });

        $results = $results->toArray();
        array_unshift($results, ['code' => null, 'label' => 'All']);

        return $results;
    }

    public function getValuationAccount()
    {
        $results = $this->collection
            ->sortBy('account')
            ->unique('account')
            ->pluck('account')
        ;

        $results = array_unique($results->toArray());

        $results = collect($results)->map(function ($value) {
            return [
                'code' => $value,
                'label' => $value,
            ];
        });

        $results = $results->toArray();
        array_unshift($results, ['code' => null, 'label' => 'All']);

        return $results;
    }
}