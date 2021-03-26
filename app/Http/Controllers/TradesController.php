<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Models\Custodian;
use App\Models\Portfolio;
use App\Models\Trades;
use App\Services\DataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class TradesController extends Controller
{
    /** @var DataService $dataService */
    protected $dataService;

    /**
     * CurrencyController constructor.
     *
     * @param DataService $dataService
     */
    public function __construct(DataService $dataService)
    {
        $this->dataService = $dataService;
    }

    public function index()
    {
        $trades = Trades::data(
            'DUM',
            Request::get('from'),
            Request::get('to'),
            Request::get('currency'),
            Request::get('asset_class'),
            Request::get('custodian'),
            Request::get('account')
        );

        return Inertia::render('Trades/Index', [
            'filters' => Request::all(['from', 'to', 'currency', 'asset_class', 'custodian', 'account']),
            'trades' => $trades,
            'payload' => [
                'from' => $this->dataService->getValuationDate(),
                'to' => $this->dataService->getValuationDate(),
                'currency' => $this->dataService->getBaseCurrency(),
                'asset_class' => Portfolio::assetClass(),
                'custodian' => Custodian::names(),
                'account' => Account::toCollection(true)
            ]
        ]);
    }
}
