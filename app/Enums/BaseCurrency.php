<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static EUR()
 * @method static static USD()
 * @method static static CHF()
 */
final class BaseCurrency extends Enum
{
    const EUR = 1;
    const USD = 2;
    const CHF = 3;
}
