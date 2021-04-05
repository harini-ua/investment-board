<?php

namespace App\Services;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DataService
{
    private const PROCEDURE = [
        'currency' => 'fn_get_currency',
        'custodian' => 'fn_get_custodian',
    ];

    /**
     * Get base currency
     *
     * @return array
     */
    public function getBaseCurrency()
    {
        /** @var User $user */
        $user = Auth::user();

        $results = $user->pluck('base_currency');

        $results = $results->map(function ($value) {
            return [
                'code' => $value,
                'label' => $value,
            ];
        });

        return $results->toArray();
    }

    /**
     * Get valuation date
     *
     * @return array
     */
    public function getValuationDate()
    {
        $results = DB::table('par_valuation_date')
            ->orderBy('valuation_date', 'DESC')
            ->pluck('valuation_date')
        ;

        $results = $results->map(function ($value) {
            return [
                'code' => $value,
                'label' => Carbon::parse($value)->format('d/m/Y'),
            ];
        });

        return $results->toArray();
    }

    /**
     * Get valuation method
     *
     * @return array
     */
    public function getValuationMethod()
    {
        $results = DB::table('par_valuation_method')
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
     * Get currency data
     *
     * @param string|null $clientCode
     * @param string|null $method
     * @param string|null $date
     * @param string|null $currency
     *
     * @return mixed
     */
    public function getCurrency($clientCode, $method, $date, $currency): array
    {
        $procedure = self::PROCEDURE['currency'];
        $params = [
            $clientCode, $date, $currency, $method
        ];

        return $this->callProcedure($procedure, $params);
    }

    /**
     * Get custodian data
     *
     * @param string|null $clientCode
     * @param string|null $method
     * @param string|null $currency
     * @param string|null $date
     *
     * @return mixed
     */
    public function getCustodian($clientCode, $date, $currency, $method): array
    {
        $procedure = self::PROCEDURE['custodian'];
        $params = [
            $clientCode, $date, $currency, $method
        ];

        return $this->callProcedure($procedure, $params);
    }

    /**
     * Call procedure
     *
     * @param $name
     * @param $params
     *
     * @return array
     */
    private function callProcedure($name, $params)
    {
        $arg = implode(',', array_fill(0, count($params), '?'));

        return DB::select("call $name($arg)", $params);
    }
}