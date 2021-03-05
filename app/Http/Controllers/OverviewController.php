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
        $portfolioAsset = Portfolio::asset(null, Request::get('method'), Request::get('date'), Request::get('currency'));

        return Inertia::render('Overview/Index', [
            'filters' => Request::all(['method', 'date', 'currency']),
            'portfolioAsset' => $portfolioAsset,
            'payload' => [
                'method' => ValuationMethod::toCollection(),
                'currency' => BaseCurrency::getKeys(),
            ]
        ]);
    }
}
