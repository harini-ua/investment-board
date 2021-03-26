<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Custodian extends Model
{
    use HasFactory;

    public const TABLE_NAME = 'custodian';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = self::TABLE_NAME;

    /**
     * Get Custodian Asset
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
            'custodian_name', 'kfp_asset_class', 'value'
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

        $result->map(function ($item) {
            $item['active'] = false;
            return $item;
        });

        return $result;
    }

    /**
     * Get asset class
     *
     * @return array
     */
    public static function names()
    {
        $query = self::query();

        $query->select(['custodian_name']);
        $query->orderBy('custodian_name');
        $query->groupBy('custodian_name');
        $results = $query->get()->pluck('custodian_name');

        $results = $results->map(function ($value) {
            return [
                'code' => $value,
                'label' => $value,
            ];
        });

        $results = $results->toArray();
        array_unshift($results, ['code' => null, 'label' => 'All']);

        return $results;
    }
}
