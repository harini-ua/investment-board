<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
    use HasFactory;

    public const TABLE_NAME = 'portfolio';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = self::TABLE_NAME;

    /**
     * Get Portfolio Asset
     *
     * @param string|null $clientCode
     * @param string|null $method
     * @param string|null $currency
     * @param string|null $date
     *
     * @return mixed
     */
    public static function asset($clientCode, $method, $date, $currency)
    {
        $query = self::query();
        $query->select('kfp_asset_class', 'mtd_value', 'mtd_pl', 'ytd_pl', 'mtd_percentage',
                              'ytd_percentage');

        if ($currency) {
            $query->where('valuation_currency', $currency);
        }
        if ($date) {
            $query->whereDate('period_date', Carbon::parse($date)->toDateString());
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
