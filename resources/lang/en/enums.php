<?php

use App\Enums\BaseCurrency;
use App\Enums\ValuationMethod;

return [

    BaseCurrency::class => [
        BaseCurrency::EUR => 'EUR',
    ],

    ValuationMethod::class => [
        ValuationMethod::MarketValue => 'Market Value',
        ValuationMethod::Exposure => 'Exposure',
    ],

];