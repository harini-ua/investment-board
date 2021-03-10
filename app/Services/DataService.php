<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;

class DataService
{
    private const PROCEDURE = [
        'currency' => 'fn_get_currency',
        'custodian' => 'fn_get_custodian',
    ];

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
}