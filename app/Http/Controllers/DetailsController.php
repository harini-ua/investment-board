<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\DetailsDataService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DetailsController extends Controller
{
    public const FILTER_FIELDS = [
        'method', 'date', 'currency', 'asset_class', 'custodian', 'account'
    ];

    /** @var DetailsDataService $dataService */
    protected $dataService;

    /**
     * CurrencyController constructor.
     *
     * @param DetailsDataService $dataService
     */
    public function __construct(DetailsDataService $dataService)
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

        return Inertia::render('Details/Index', [
            'filters' => $request->only(self::FILTER_FIELDS),
            'positionOpen' => $this->dataService->positionOpen(),
            'payload' => [
                'method' => $this->dataService->getFilter('method'),
                'date' => $this->dataService->getFilter('date'),
                'currency' => $this->dataService->getFilter('currency'),
                'asset_class' => $this->dataService->getFilter('asset_class'),
                'custodian' => $this->dataService->getFilter('custodian'),
                'account' => $this->dataService->getFilter('account'),
            ]
        ]);
    }
}
