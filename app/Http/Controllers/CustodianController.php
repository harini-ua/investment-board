<?php

namespace App\Http\Controllers;

use App\Enums\BaseCurrency;
use App\Enums\ValuationMethod;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CustodianController extends Controller
{
    public function index()
    {
        return Inertia::render('Custodian/Index', [
            'filters' => Request::all(['valuation_method', 'valuation_date', 'base_currency']),
            'payload' => [
                'valuationMethod' => ValuationMethod::asSelectArray(),
                'baseCurrency' => BaseCurrency::asSelectArray(),
            ]
        ]);
    }
}
