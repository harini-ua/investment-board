<?php

namespace App\Http\Controllers;

use App\Enums\BaseCurrency;
use App\Enums\ValuationMethod;
use App\Models\Portfolio;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class OverviewController extends Controller
{
    public function index()
    {
        $portfolioAsset = Portfolio::asset();

        return Inertia::render('Overview/Index', [
            'filters' => Request::all(['valuationMethod', 'valuationDate', 'baseCurrency']),
            'portfolioAsset' => $portfolioAsset,
            'overview' => [],
            'payload' => [
                'valuationMethod' => ValuationMethod::toCollection(),
                'baseCurrency' => BaseCurrency::getKeys(),
            ]
        ]);
    }
}
