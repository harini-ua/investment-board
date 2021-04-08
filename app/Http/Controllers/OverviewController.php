<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\OverviewDataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class OverviewController extends Controller
{
    /** @var OverviewDataService $dataService */
    protected $dataService;

    /**
     * CurrencyController constructor.
     *
     * @param OverviewDataService $dataService
     */
    public function __construct(OverviewDataService $dataService)
    {
        $this->dataService = $dataService;
    }

    public function index(Request $request)
    {
        /** @var User $user */
        $user = auth()->user();
        $data = ['method' => 'VALUE', 'date' => '2020-12-31'];

        $this->dataService->init($user, $data);

        return Inertia::render('Overview/Index', [
            'filters' => Request::all(['method', 'date', 'currency']),
            'portfolioAsset' =>  $this->dataService->getPortfolioAsset(),
            'portfolioAllocation' => $this->dataService->getPortfolioAllocation(),
            'totalWealth' => $this->dataService->getTotalWealth(),
            'totalWealthAllocation' => $this->dataService->getTotalWealthAllocation(),
            'benchmarks' => $this->dataService->getBenchmarks(),
            'payload' => [
                'method' => $this->dataService->getFilter('method'),
                'date' => $this->dataService->getFilter('date'),
                'currency' => $this->dataService->getFilter('currency'),
            ]
        ]);
    }
}
