<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Models\Custodian;
use App\Models\Portfolio;
use App\Models\Position;
use App\Models\User;
use App\Services\DataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class DetailsController extends Controller
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

        $positionOpen = Position::open(
            $user->client_code,
            'VALUE',
            '2020-12-31',
            $user->base_currency,
            Request::get('asset_class'),
            Request::get('custodian'),
            Request::get('account')
        );

        return Inertia::render('Details/Index', [
            'filters' => Request::all(['method', 'date', 'currency', 'asset_class', 'custodian', 'account']),
            'positionOpen' => $positionOpen,
            'payload' => [
                'method' => $this->dataService->getValuationMethod(),
                'date' => $this->dataService->getValuationDate(),
                'currency' => $this->dataService->getBaseCurrency(),
                'asset_class' => Portfolio::assetClass(),
                'custodian' => Custodian::names(),
                'account' => Account::toCollection(true)
            ]
        ]);
    }
}
