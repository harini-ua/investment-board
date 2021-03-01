<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Enums\AssetClass;
use App\Enums\BaseCurrency;
use App\Enums\Custodian;
use App\Enums\ValuationMethod;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class DetailsController extends Controller
{
    public function index()
    {
        return Inertia::render('Details/Index', [
            'filters' => Request::all(['valuation_method', 'valuation_date', 'base_currency', 'asset_class', 'custodian', 'account']),
            'details' => [],
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
