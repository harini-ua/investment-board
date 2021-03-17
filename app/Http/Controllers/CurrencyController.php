<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Enums\AssetClass;
use App\Enums\BaseCurrency;
use App\Enums\Custodian;
use App\Enums\ValuationMethod;
use App\Services\DataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CurrencyController extends Controller
{
    /** @var DataService $dataService */
    protected $dataService;

    /**
     * CurrencyController constructor.
     *
     * @param DataService $dataService
     */
    public function __construct(DataService $dataService)
    {
        $this->dataService = $dataService;
    }

    public function index()
    {
        $currencyExposure = $this->dataService->getCurrency('DUM', '2020-12-31', 'EUR', 'VALUE');

        $sum = collect($currencyExposure)->sum('value');
        collect($currencyExposure)->map(function ($item) use ($sum) {
            $item->active = false;
            $item->percentage = round( $item->value / $sum * 100, 2);
            return $item;
        });

        return Inertia::render('Currency/Index', [
            'filters' => Request::all(['method', 'date', 'currency', 'asset_class', 'custodian', 'account']),
            'currency' => $currencyExposure,
            'payload' => [
                'method' => $this->dataService->getValuationMethod(),
                'date' => $this->dataService->getValuationDate(),
                'currency' => $this->dataService->getBaseCurrency(),
                'asset_class' => AssetClass::toCollection(true),
                'custodian' => Custodian::toCollection(true),
                'account' => Account::toCollection(true)
            ]
        ]);
    }
}
