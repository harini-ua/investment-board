<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\TradesDataService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class TradesController extends Controller
{
    public const FILTER_FIELDS = [
        'from', 'to', 'currency', 'asset_class', 'custodian', 'account'
    ];

    /** @var TradesDataService $dataService */
    protected $dataService;

    /**
     * CurrencyController constructor.
     *
     * @param TradesDataService $dataService
     */
    public function __construct(TradesDataService $dataService)
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
        $fields = array_merge(self::FILTER_FIELDS, ['chosen']);
        $data = $request->only($fields);

        $this->dataService->init($user, $data);

        return Inertia::render('Trades/Index', [
            'filters' => $request->only($fields),
            'trades' => $this->dataService->getTrades(),
            'payload' => [
                'from' => $this->dataService->getFilter('from'),
                'to' => $this->dataService->getFilter('to'),
                'currency' => $this->dataService->getFilter('currency'),
                'asset_class' => $this->dataService->getFilter('asset_class'),
                'custodian' => $this->dataService->getFilter('custodian'),
                'account' => $this->dataService->getFilter('account'),
            ]
        ]);
    }
}
