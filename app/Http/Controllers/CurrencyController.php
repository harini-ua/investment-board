<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Enums\AssetClass;
use App\Enums\BaseCurrency;
use App\Enums\Custodian;
use App\Enums\ValuationMethod;
use App\Models\Currency;
use App\Services\DataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CurrencyController extends Controller
{
    /** @var DataService $dataService */
    protected $dataService;

    public function __construct(DataService $dataService)
    {
        $this->dataService = $dataService;
    }

    public function index()
    {
//        $currency = Currency::getData(Request::all(['method', 'date', 'currency']));

        return Inertia::render('Currency/Index', [
            'filters' => Request::all(['method', 'date', 'currency', 'asset_class', 'custodian', 'account']),
            'currency' => [],
            'payload' => [
                'method' => ValuationMethod::toCollection(),
                'currency' => BaseCurrency::getKeys(),
                'assetClass' => AssetClass::asSelectArray(),
                'custodian' => Custodian::asSelectArray(),
                'account' => Account::asSelectArray()
            ]
        ]);
    }
}
