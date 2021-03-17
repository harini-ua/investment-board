<?php

namespace App\Services;

use Carbon\Carbon;
use Illuminate\Support\Collection;
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
        $results = DB::table('par_base_currency')
            ->pluck('base_currency')
        ;

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
        $results =  DB::table('par_valuation_method')
            ->pluck('valuation_method')
        ;

        $results = $results->map(function ($value) {
            return [
                'code' => $value,
                'label' => $value,
            ];
        });

        return $results->toArray();
    }

    /**
     * Get currency data
     *
     * @param string|null $clientCode
     * @param string|null $method
     * @param string|null $currency
     * @param string|null $date
     *
     * @return mixed
     */
    public function getCurrency($clientCode = 'DUM', $date = '2020-12-31', $currency = 'EUR', $method = 'VALUE'): array
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
    public function getCustodian($clientCode = 'DUM', $date = '2020-12-31', $currency = 'EUR', $method = 'VALUE'): array
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

//    /**
//     * To select formatted.
//     *
//     * @param bool $nullOptions
//     *
//     * @return Collection
//     */
//    private static function toSelect($results, $nullOptions = false): Collection
//    {
//        $values = new Collection();
//
//        if ($nullOptions) {
//            $values->push((object) ['code' => null, 'label' => 'All']);
//        }
//
//        foreach (self::toSelectArray() as $key => $value) {
//            $values->push((object) [
//                'code' => $key,
//                'label' => $value,
//            ]);
//        }
//
//        return $values;
//    }
}