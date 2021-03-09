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
     * @param string|null $currency
     * @param string|null $date
     *
     * @return mixed
     */
    public static function open($clientCode, $method, $currency, $date)
    {
        $query = self::query();
        $query->select('instrument_name', 'quantity', 'currency', 'last_purchase', 'currency', 'cost_price',
                              'valuation_price', 'cost_local', 'valuation_local', 'valuation_base',
                              'mtd_pl', 'ytd_pl', 'mtd_return', 'ytd_return', 'sp_return');

        if ($clientCode) {
            $query->where('client_code', $clientCode);
        }
        if ($currency) {
            $query->where('valuation_currency', $currency);
        }
        if ($date) {
            $query->where('period_date', Carbon::parse($date)->toDateString());
        }
        if ($method) {
            $query->where('valuation_method', $method);
        }

        $result = $query->get();

        $result->map(function ($item) {
            $item['active'] = false;
            return $item;
        });

        return $result->toArray();
    }
}
