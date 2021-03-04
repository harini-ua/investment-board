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
     */
    public function getCurrency(): array
    {
        $procedure = self::PROCEDURE['currency'];
        $params = [];

        return $this->callProcedure($procedure, $params);
    }

    /**
     * Get custodian data
     */
    public function getCustodian(): array
    {
        $procedure = self::PROCEDURE['custodian'];
        $params = [];

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