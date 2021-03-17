<?php

namespace App\Enums;

use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum;

final class BaseCurrency extends Enum implements LocalizedEnum
{
    use CollectionTrait;

    const EUR = 'EUR';

    static function get()
    {
        return self::EUR;
    }
}
