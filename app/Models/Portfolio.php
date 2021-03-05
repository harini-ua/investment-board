<?php

namespace App\Models;

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
     * @param string|null $currency
     * @param string|null $date
     * @param string|null $method
     *
     * @return mixed
     */
    public static function asset($clientCode, $currency, $date, $method)
    {
        $query = self::select('kfp_asset_class', 'mtd_value', 'mtd_pl', 'ytd_pl', 'mtd_percentage',
                              'ytd_percentage');

        if ($clientCode) {
            $query->where('client_code', $clientCode);
        }
        if ($currency) {
            $query->where('valuation_currency', $currency);
        }
        if ($date) {
            $query->where('period_date', $date);
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
