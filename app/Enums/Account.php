<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static OptionOne()
 * @method static static OptionTwo()
 * @method static static OptionThree()
 */
final class Account extends Enum
{
    use CollectionTrait;

    const OptionOne = 0;
    const OptionTwo = 1;
    const OptionThree = 2;
}
