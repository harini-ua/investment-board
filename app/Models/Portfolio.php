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
     * @param boolean|null $isChart
     *
     * @return mixed
     */
    public static function asset($clientCode, $method = null, $date = null, $currency = null, $isChart = false)
    {
        $query = self::query();

        $query->select([
           // Filter fields
           'period_date', 'valuation_method', 'valuation_currency',
           // Data fields
           'kfp_asset_class',
        ]);

        $query->selectRaw("SUM(mtd_value) AS mtd_value");

        if (!$isChart) {
            $query->selectRaw("SUM(mtd_pl) AS mtd_pl");
            $query->selectRaw("SUM(ytd_pl) AS ytd_pl");
            $query->selectRaw("SUM(mtd_percentage) AS mtd_percentage");
            $query->selectRaw("SUM(ytd_percentage) AS ytd_percentage");
            $query->selectRaw("SUM(mtd_benchmark) AS mtd_benchmark");
            $query->selectRaw("SUM(ytd_benchmark) AS ytd_benchmark");
        }

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

        $query->groupBy('kfp_asset_class');

        $result = $query->get();

        $sum = $result->sum('mtd_value');

        $result->map(function ($item) use ($sum) {
            $item['active'] = false;
            $item['value_percentage'] = round( $item['mtd_value'] / $sum * 100, 1);
            return $item;
        });

        return $result;
    }
}
