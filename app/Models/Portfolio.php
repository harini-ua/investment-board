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
     * @param string $clientCode
     * @param string $valuationCurrency
     * @param string $periodDate
     * @param string $valuationMethod
     *
     * @return mixed
     */
    public static function asset($clientCode = 'DUM', $valuationCurrency = 'EUR',
                                 $periodDate = '2020-12-31', $valuationMethod = 'VALUE')
    {
        $result = self::select('kfp_asset_class', 'mtd_value', 'mtd_pl', 'ytd_pl', 'mtd_percentage',
                            'ytd_percentage')
            ->where('client_code', $clientCode)
            ->where('valuation_currency', $valuationCurrency)
            ->where('period_date', $periodDate)
            ->where('valuation_method', $valuationMethod)
            ->get()
        ;

        $result->map(function ($item) {
            $item['active'] = false;
            return $item;
        });

        return $result->toArray();
    }
}
