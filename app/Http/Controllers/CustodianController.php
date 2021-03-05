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
            'filters' => Request::all(['method', 'date', 'currency']),
            'payload' => [
                'method' => ValuationMethod::toCollection(),
                'currency' => BaseCurrency::getKeys(),
            ]
        ]);
    }
}
