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

    public function __construct(DataService $dataService)
    {
        $this->dataService = $dataService;
    }

    public function index()
    {
        return Inertia::render('Currency/Index', [
            'filters' => Request::all(['valuationMethod', 'valuationDate', 'baseCurrency', 'asset_class', 'custodian', 'account']),
            'currency' => $this->dataService->getCurrency(),
            'payload' => [
                'valuationMethod' => ValuationMethod::asSelectArray(),
                'baseCurrency' => BaseCurrency::asSelectArray(),
                'assetClass' => AssetClass::asSelectArray(),
                'custodian' => Custodian::asSelectArray(),
                'account' => Account::asSelectArray()
            ]
        ]);
    }
}
