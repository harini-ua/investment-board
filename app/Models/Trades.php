<?php

namespace App\Models;

use Carbon\Carbon;
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
     * @param boolean|null $general
     *
     * @return mixed
     */
    public static function data(
        $clientCode,
        $from = null,
        $to = null,
        $currency = null,
        $assetClass = null,
        $custodian = null,
        $account = null,
        $general = false
    ) {
        $query = self::query();
        $query->select([
            // Filter fields
            'date', 'ccy', 'asset_class', 'custodian', 'account',
            // Data fields
            'date', 'movement', 'name', 'quantity', 'cost_price', 'net_price', 'amount_base',
            'custodian', 'isin', 'issuer', 'instrument', 'realized_local',
            'realized_base', 'amount_base', 'fx_rate', 'gross_price', 'comission', 'tax'
        ]);

        $query->where('client_code', $clientCode);

        if ($from) {
            $query->whereDate('date', '>=', Carbon::parse($from)->toDateString());
        }
        if ($to) {
            $query->whereDate('date', '<=', Carbon::parse($to)->toDateString());
        }
        if ($currency) {
            $query->where('ccy', $currency);
        }
        if ($assetClass) {
            $query->where('asset_class', $assetClass);
        }
        if ($custodian) {
            $query->where('custodian', $custodian);
        }
        if ($account) {
            $query->where('account', $account);
        }

        $result = $query->get();

        if ($general) {
            // TODO
        }

        $result->map(function ($item) {
            $item['active'] = false;
            return $item;
        });

        return $result;
    }
}
