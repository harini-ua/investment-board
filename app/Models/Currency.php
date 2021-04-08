<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    use HasFactory;

    public const TABLE_NAME = 'currency';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = self::TABLE_NAME;

    /**
     * Get Currency
     *
     * @param string|null $clientCode
     * @param string|null $method
     * @param string|null $currency
     * @param string|null $date
     *
     * @return mixed
     */
    public static function data($clientCode, $method, $date, $currency)
    {
        $query = self::query();

        $query->select([
             'period_date', 'valuation_method', 'valuation_currency',
             'currency', 'category', 'value'
        ]);

        $query->where('client_code', $clientCode);

        if ($date) {
            $query->whereDate('period_date', Carbon::parse($date)->toDateString());
        }
        if ($method) {
            $query->where('valuation_method', $method);
        }
        if ($currency) {
            $query->where('valuation_currency', $currency);
        }

        $result = $query->get();

//        $result->map(function ($item) {
//            $item['active'] = false;
//            return $item;
//        });

        return $result;
    }
}
