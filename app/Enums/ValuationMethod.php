<?php

namespace App\Enums;

use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum;

/**
 * @method static static MarketValue()
 * @method static static Exposure()
 */
final class ValuationMethod extends Enum implements LocalizedEnum
{
    use CollectionTrait;

    const MarketValue = 'VALUE';
    const Exposure = 'EX';
}
