<?php

namespace App\Http\Controllers;

use App\Enums\BaseCurrency;
use App\Enums\ValuationMethod;
use App\Models\Benchmark;
use App\Models\Portfolio;
use App\Models\Wealth;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class OverviewController extends Controller
{
    public function index()
    {
        $portfolioAsset = Portfolio::asset(null, Request::get('method'), Request::get('date'), Request::get('currency'));
        $portfolioAllocation = $portfolioAsset->pluck('mtd_percentage', 'kfp_asset_class');

        // Total
        $portfolioAsset->push([
            'kfp_asset_class' =>'Total',
            'mtd_value' => $portfolioAsset->sum('mtd_value'),
            'mtd_pl' => $portfolioAsset->sum('mtd_pl'),
            'ytd_pl' => $portfolioAsset->sum('ytd_pl'),
            'mtd_percentage' => $portfolioAsset->sum('mtd_percentage'),
            'mtd_benchmark' => $portfolioAsset->sum('mtd_benchmark'),
            'ytd_percentage' => $portfolioAsset->sum('ytd_percentage'),
            'ytd_benchmark' => $portfolioAsset->sum('ytd_benchmark'),
            'active' => false,
        ]);

        $totalWealth = Wealth::total(null, Request::get('method'), Request::get('date'), Request::get('currency'));
        $totalWealthAllocation = $totalWealth->pluck('mtd_percentage', 'category');

        // Total
        $totalWealth->push([
            'category' => 'Grant Total',
            'mtd_value' => $totalWealth->sum('mtd_value'),
            'mtd_pl' => $totalWealth->sum('mtd_pl'),
            'ytd_pl' => $totalWealth->sum('ytd_pl'),
            'mtd_percentage' => $totalWealth->sum('mtd_percentage'),
            'ytd_percentage' => $totalWealth->sum('ytd_percentage'),
            'mtd_benchmark' => $totalWealth->sum('mtd_benchmark'),
            'ytd_benchmark' => $totalWealth->sum('ytd_benchmark'),
            'active' => false,
        ]);

        $benchmarks = Benchmark::data();

        return Inertia::render('Overview/Index', [
            'filters' => Request::all(['method', 'date', 'currency']),
            'portfolioAsset' => $portfolioAsset->toArray(),
            'portfolioAllocation' => $portfolioAllocation,
            'totalWealth' => $totalWealth->toArray(),
            'totalWealthAllocation' => $totalWealthAllocation,
            'benchmarks' => $benchmarks,
            'payload' => [
                'method' => ValuationMethod::toCollection(),
                'currency' => BaseCurrency::getKeys(),
            ]
        ]);
    }
}
