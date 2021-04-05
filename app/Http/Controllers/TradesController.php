<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Models\Custodian;
use App\Models\Portfolio;
use App\Models\Trades;
use App\Models\User;
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
        /** @var User $user */
        $user = auth()->user();

        $trades = Trades::data(
            $user->client_code,
            '2020-12-31',
            '2020-12-31',
            $user->base_currency,
            Request::get('asset_class'),
            Request::get('custodian'),
            Request::get('account')
        );

        return Inertia::render('Trades/Index', [
            'filters' => Request::all(['from', 'to', 'currency', 'asset_class', 'custodian', 'account']),
            'trades' => $trades,
            'payload' => [
                'from' => '2020-12-31',
                'to' => '2020-12-31',
                'currency' => $this->dataService->getBaseCurrency(),
                'asset_class' => Portfolio::assetClass(),
                'custodian' => Custodian::names(),
                'account' => Account::toCollection(true)
            ]
        ]);
    }
}
