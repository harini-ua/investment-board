<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    use HasFactory;

    public const TABLE_NAME = 'currency';
    public const PROCEDURE_NAME = 'fn_get_currency';

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = self::TABLE_NAME;

    /**
     * Get currency data
     */
    static function getData($filter): array
    {
        $params = [

        ];

        return callProcedure(self::PROCEDURE_NAME, $params);
    }
}
