<?php

use Illuminate\Support\Facades\DB;

if (! function_exists('callProcedure')) {
    /**
     * Call procedure
     *
     * @param $name
     * @param $params
     *
     * @return array
     */
    function callProcedure($name, $params)
    {
        $arg = implode(',', array_fill(0, count($params), '?'));

        return DB::select("call $name($arg)", $params);
    }
}