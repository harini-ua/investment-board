<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\DetailsDataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class DetailsController extends Controller
{
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

    public function index(Request $request)
    {
        /** @var User $user */
        $user = auth()->user();
        $data = ['from' => '2020-12-31', 'to' => '2020-12-31'];

        $this->dataService->init($user, $data);

        return Inertia::render('Details/Index', [
            'filters' => Request::all(['method', 'date', 'currency', 'asset_class', 'custodian', 'account']),
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
