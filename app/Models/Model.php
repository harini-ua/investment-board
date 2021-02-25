<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model as Eloquent;
use Illuminate\Database\Eloquent\SoftDeletes;

abstract class Model extends Eloquent
{
    protected $guarded = [];

    public function resolveRouteBinding($value, $field = null)
    {
        return in_array(SoftDeletes::class, class_uses($this), true)
            ? $this->where($this->getRouteKeyName(), $value)->withTrashed()->first()
            : parent::resolveRouteBinding($value);
    }
}
