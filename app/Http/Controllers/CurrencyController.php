<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Models\Currency;
use App\Models\Custodian;
use App\Models\Portfolio;
use App\Models\User;
use App\Services\CurrencyDataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CurrencyController extends Controller
{
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

    public function index()
    {
        /** @var User $user */
        $user = auth()->user();
        $data = ['from' => '2020-12-31', 'to' => '2020-12-31'];

        $this->dataService->init($user, $data);

        return Inertia::render('Currency/Index', [
            'filters' => Request::all(['method', 'date', 'currency', 'asset_class', 'custodian', 'account']),
            'currencyExposureData' => $this->dataService->exposureData(),
            'currencyExposureCart' => $this->dataService->exposureCart(),
            'currencyHedging' => $this->dataService->hedging(),
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
