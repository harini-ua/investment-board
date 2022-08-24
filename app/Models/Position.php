<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Position extends Model
{
    use HasFactory;

    public const TABLE_NAME = 'position';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = self::TABLE_NAME;

    /**
     * Get Open Position
     *
     * @param string|null $clientCode
     * @param string|null $method
     * @param string|null $date
     * @param string|null $currency
     * @param string|null $assetClass
     * @param string|null $custodian
     * @param string|null $account
     *
     * @return mixed
     */
    public static function open($clientCode, $method = null, $date = null, $currency = null, $assetClass = null, $custodian = null, $account = null)
    {
        $query = self::query();
        $query->select(
            // Filter fields
            'valuation_method', 'period_date', 'currency',
            'asset_class', 'custodian', 'account',
            // Data fields
            'instrument_name', 'quantity', 'currency', 'last_purchase',
            'cost_price', 'valuation_price', 'cost_local', 'valuation_local', 'valuation_base',
            'mtd_pl', 'ytd_pl', 'mtd_return', 'ytd_return', 'sp_return', 'interest', 'dividend',
            'commission', 'tax'
        );

        $query->where('client_code', $clientCode);

        if ($method) {
            $query->where('valuation_method', $method);
        }
        if ($date) {
            $query->where('period_date', Carbon::parse($date)->toDateString());
        }
        if ($currency) {
            $query->where('currency', $currency);
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

        $result->map(function ($item) {
            $item['active'] = false;
            return $item;
        });

        return $result;
    }
}
