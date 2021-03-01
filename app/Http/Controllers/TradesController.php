<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Enums\AssetClass;
use App\Enums\BaseCurrency;
use App\Enums\Custodian;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class TradesController extends Controller
{
    public function index()
    {
        return Inertia::render('Trades/Index', [
            'filters' => Request::all(['valuation_method', 'valuation_date', 'base_currency', 'asset_class', 'custodian', 'account']),
            'trades' => [],
            'payload' => [
                'baseCurrency' => BaseCurrency::asSelectArray(),
                'assetClass' => AssetClass::asSelectArray(),
                'custodian' => Custodian::asSelectArray(),
                'account' => Account::asSelectArray()
            ]
        ]);
    }
}
