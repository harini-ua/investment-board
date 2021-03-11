<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Enums\AssetClass;
use App\Enums\BaseCurrency;
use App\Enums\Custodian;
use App\Enums\ValuationMethod;
use App\Models\Position;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class DetailsController extends Controller
{
    public function index()
    {
        $positionOpen = Position::open(null, Request::get('method'), Request::get('date'), Request::get('currency'));

        return Inertia::render('Details/Index', [
            'filters' => Request::all(['method', 'date', 'currency', 'asset_class', 'custodian', 'account']),
            'positionOpen' => $positionOpen,
            'payload' => [
                'method' => ValuationMethod::toCollection(),
                'currency' => BaseCurrency::getKeys(),
                'asset_class' => AssetClass::toCollection(true),
                'custodian' => Custodian::toCollection(true),
                'account' => Account::toCollection(true)
            ]
        ]);
    }
}
