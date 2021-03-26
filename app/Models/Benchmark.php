<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Benchmark extends Model
{
    use HasFactory;

    public const TABLE_NAME = 'benchmark';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = self::TABLE_NAME;

    /**
     * Get Benchmarks
     *
     * @param string|null $date
     *
     * @return mixed
     */
    public static function data($date)
    {
        $query = self::query();
        $query->select(['benchmark_date', 'indice', 'mtd_percentage', 'ytd_percentage']);

        if ($date) {
            $query->whereDate('benchmark_date', Carbon::parse($date)->toDateString());
        }

        $result = $query->get();

        $result->map(function ($item) {
            $item['active'] = false;
            return $item;
        });

        return $result->toArray();
    }
}
