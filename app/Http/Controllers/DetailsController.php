<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Enums\AssetClass;
use App\Models\Custodian;
use App\Models\Portfolio;
use App\Models\Position;
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
        $positionOpen = Position::open(null, Request::get('method'), Request::get('date'), Request::get('currency'));

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
