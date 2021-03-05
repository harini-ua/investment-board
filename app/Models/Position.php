<?php

namespace App\Models;

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
     * @param string $clientCode
     * @param string $valuationCurrency
     * @param string $periodDate
     * @param string $valuationMethod
     *
     * @return mixed
     */
    public static function open($clientCode = 'DUM', $valuationCurrency = 'EUR',
                                $periodDate = '2020-12-31', $valuationMethod = 'VALUE')
    {
        $result = self::select('instrument_name', 'quantity', 'last_purchase', 'currency', 'cost_price',
                            'valuation_price', 'cost_local', 'valuation_local', 'valuation_base',
                            'mtd_pl', 'ytd_pl', 'mtd_return', 'ytd_return', 'sp_return')
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
