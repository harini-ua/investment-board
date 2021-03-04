<?php

namespace App\Enums;

use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum;

/**
 * @method static static EUR()
 * @method static static USD()
 * @method static static CHF()
 */
final class BaseCurrency extends Enum implements LocalizedEnum
{
    use CollectionTrait;

    const EUR = 'EUR';
    const USD = 'USD';
    const CHF = 'CHF';
}
