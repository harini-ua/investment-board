<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\CurrencyDataService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CurrencyController extends Controller
{
    public const FILTER_FIELDS = [
        'method', 'date', 'currency', 'custodian', 'account'
    ];

    /** @var CurrencyDataService $dataService */
    protected $dataService;

    /**
     * CurrencyController constructor.
     *
     * @param CurrencyDataService $dataService
     */
    public function __construct(CurrencyDataService $dataService)
    {
        $this->dataService = $dataService;
    }

    /**
     * @param \Illuminate\Http\Request $request
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

        return Inertia::render('Currency/Index', [
            'filters' => $request->only($fields),
            'currencyExposureData' => $this->dataService->exposureData(),
            'currencyExposureCart' => $this->dataService->exposureCart(),
            'currencyHedging' => $this->dataService->hedging(),
            'payload' => [
                'method' => $this->dataService->getFilter('method'),
                'date' => $this->dataService->getFilter('date'),
                'currency' => $this->dataService->getFilter('currency'),
                'custodian' => $this->dataService->getFilter('custodian'),
                'account' => $this->dataService->getFilter('account'),
            ]
        ]);
    }
}
