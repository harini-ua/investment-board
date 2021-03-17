<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Enums\AssetClass;
use App\Enums\BaseCurrency;
use App\Enums\Custodian;
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
//        $trades = Trades::data();

        return Inertia::render('Trades/Index', [
            'filters' => Request::all(['from', 'to', 'currency', 'asset_class', 'custodian', 'account']),
            'trades' => [],
            'payload' => [
                'from' => $this->dataService->getValuationDate(),
                'to' => $this->dataService->getValuationDate(),
                'currency' => $this->dataService->getBaseCurrency(),
                'asset_class' => AssetClass::toCollection(true),
                'custodian' => Custodian::toCollection(true),
                'account' => Account::toCollection(true)
            ]
        ]);
    }
}
