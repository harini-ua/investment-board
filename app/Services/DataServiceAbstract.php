<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

abstract class DataServiceAbstract
{
    /** @var Collection  */
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
     * @param string $column
     *
     * @return array
     */
    public function getValuationMethod(string $column = 'valuation_method')
    {
        $methods = array_unique($this->collection->sortBy($column)->pluck($column)->toArray());

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
     * @param string $column
     *
     * @return array
     */
    public function getDateFrom(string $column = 'date')
    {
        $from = $this->collection
            ->sortByDesc($column)
            ->pluck($column)
            ->unique()
            ->toArray()
        ;

        return array_values($from);
    }

    /**
     * Get valuation date
     *
     * @param string $column
     *
     * @return array
     */
    public function getDateTo(string $column = 'date')
    {
        $to = $this->collection
            ->sortByDesc($column)
            ->pluck($column)
            ->unique()
            ->toArray()
        ;

        return array_values($to);
    }

    /**
     * Get valuation date
     *
     * @param string $column
     *
     * @return array
     */
    public function getValuationDate(string $column = 'period_date')
    {
        $date = $this->collection
            ->sortByDesc($column)
            ->pluck($column)
            ->unique()
            ->toArray()
        ;

        return array_values($date);
    }

    /**
     * Get base currency
     *
     * @param string $column
     *
     * @return array
     */
    public function getValuationCurrency(string $column = 'base_currency')
    {
        $results = $this->user->pluck($column);

        $results = $results->map(function ($value) {
            return [
                'code' => $value,
                'label' => $value,
            ];
        });

        return $results->toArray();
    }

    /**
     * Get asset class
     *
     * @param string $column
     *
     * @return array
     */
    public function getAssetClass(string $column = 'asset_class')
    {
        $results = $this->collection->sortBy($column)->unique($column)->pluck($column);

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

    /**
     * Get custodian
     *
     * @param string $column
     *
     * @return array
     */
    public function getCustodian(string $column = 'custodian')
    {
        $results = $this->collection->sortBy($column)->unique($column)->pluck($column);

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

    /**
     * Get account
     *
     * @param string $column
     *
     * @return array
     */
    public function getAccount(string $column = 'account')
    {
        $results = $this->collection->sortBy($column)->unique($column)->pluck($column);
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