<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\TradesDataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class TradesController extends Controller
{
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

    public function index(Request $request)
    {
        /** @var User $user */
        $user = auth()->user();
        $data = ['from' => '2020-12-31', 'to' => '2020-12-31'];

        $this->dataService->init($user, $data);

        return Inertia::render('Trades/Index', [
            'filters' => Request::all(['from', 'to', 'currency', 'asset_class', 'custodian', 'account']),
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
