<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static MarketValue()
 * @method static static Exposure()
 */
final class ValuationMethod extends Enum
{
    const MarketValue = 1;
    const Exposure = 2;
}
