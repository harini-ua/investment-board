<?php

namespace App\Http\Controllers;

use App\Enums\BaseCurrency;
use App\Enums\ValuationMethod;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class OverviewController extends Controller
{
    public function index()
    {
        return Inertia::render('Overview/Index', [
            'filters' => Request::all(['valuationMethod', 'valuationDate', 'baseCurrency']),
            'overview' => [],
            'payload' => [
                'valuationMethod' => ValuationMethod::toCollection(),
                'baseCurrency' => BaseCurrency::getKeys(),
            ]
        ]);
    }
}
