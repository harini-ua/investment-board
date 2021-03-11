<?php

namespace App\Enums;

use Illuminate\Support\Collection;

trait CollectionTrait
{
    /**
     * Get the enum as an collection formatted.
     *
     * @param bool $nullOptions
     *
     * @return Collection
     */
    public static function toCollection($nullOptions = false): Collection
    {
        $values = new Collection();

        if ($nullOptions) {
            $values->push((object) ['code' => null, 'label' => 'All']);
        }

        foreach (self::toSelectArray() as $key => $value) {
            $values->push((object) [
                'code' => $key,
                'label' => $value,
            ]);
        }

        return $values;
    }
}