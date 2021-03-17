<?php

namespace App\Models;

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
