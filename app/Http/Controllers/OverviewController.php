<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\OverviewDataService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OverviewController extends Controller
{
    public const FILTER_FIELDS = [
        'method', 'date', 'currency'
    ];

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

    /**
     * @param Request $request
     *
     * @return \Inertia\Response
     */
    public function index(Request $request)
    {
        /** @var User $user */
        $user = auth()->user();
        $data = $request->only(self::FILTER_FIELDS);

        $this->dataService->init($user, $data);

        return Inertia::render('Overview/Index', [
            'filters' => $request->only(self::FILTER_FIELDS),
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
