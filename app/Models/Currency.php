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
     * @param string|null $date
     * @param string|null $custodian
     * @param string|null $account
     *
     * @return mixed
     */
    public static function data($clientCode, $method = null, $date = null, $custodian = null, $account = null)
    {
        $query = self::query();

        $query->select([
            // Filter fields
            'valuation_method', 'period_date', 'valuation_currency',
            'custodian', 'account',
            // Data fields
            'currency', 'category', 'value'
        ]);

        $query->where('client_code', $clientCode);

        if ($date) {
            $query->whereDate('period_date', Carbon::parse($date)->toDateString());
        }
        if ($method) {
            $query->where('valuation_method', $method);
        }
        if ($custodian) {
            $query->where('custodian', $custodian);
        }
        if ($account) {
            $query->where('account', $account);
        }

        $result = $query->get();

//        $result->map(function ($item) {
//            $item['active'] = false;
//            return $item;
//        });

        return $result;
    }
}
