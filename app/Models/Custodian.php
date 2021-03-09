<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Custodian extends Model
{
    use HasFactory;

    public const TABLE_NAME = 'custodian';
    public const PROCEDURE_NAME = 'fn_get_custodian';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = self::TABLE_NAME;

    /**
     * Get Custodian data
     *
     * @param string|null $clientCode
     * @param string|null $method
     * @param string|null $currency
     * @param string|null $date
     *
     * @return mixed
     */
    static function data($clientCode, $method, $date, $currency): array
    {
        $params = [
            'client_code' => 'DUM',
            'valuation_method' => 'VALUE',
            'valuation_date' => '2020-12-31',
            'valuation_currency' => 'EUR',
        ];

        return callProcedure(self::PROCEDURE_NAME, $params);
    }
}
