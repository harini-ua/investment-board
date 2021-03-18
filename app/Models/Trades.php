<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trades extends Model
{
    use HasFactory;

    public const TABLE_NAME = 'trade';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = self::TABLE_NAME;

    /**
     * Get Trades
     *
     * @param string|null $clientCode
     * @param string|null $from
     * @param string|null $to
     * @param string|null $currency
     * @param string|null $assetClass
     * @param string|null $custodian
     * @param string|null $account
     *
     * @return mixed
     */
    public static function data($clientCode, $from, $to, $currency, $assetClass, $custodian, $account)
    {
        $query = self::query();
        $query->select([
            'date', 'movement', 'name', 'quantity', 'net_price', 'amount_base',
            'custodian', 'isin', 'issuer', 'instrument', 'ccy', 'realized_base', 'amount_base', 'fx_rate', 'gross_price', 'comission', 'tax'
        ]);

        $result = $query->get();

        $result->map(function ($item) {
            $item['active'] = false;
            return $item;
        });

        return $result->toArray();
    }
}
