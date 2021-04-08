<?php

namespace App\Http\Controllers;

use App\Models\Custodian;
use App\Models\User;
use App\Services\CustodianDataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CustodianController extends Controller
{
    /** @var CustodianDataService $dataService */
    protected $dataService;

    /**
     * CustodianController constructor.
     *
     * @param CustodianDataService $dataService
     */
    public function __construct(CustodianDataService $dataService)
    {
        $this->dataService = $dataService;
    }

    public function index()
    {
        /** @var User $user */
        $user = auth()->user();
        $data = ['method' => 'VALUE', 'date' => '2020-12-31'];

        $this->dataService->init($user, $data);

        return Inertia::render('Custodian/Index', [
            'filters' => Request::all(['method', 'date', 'currency']),
            'custodians' => $this->dataService->custodians(),
            'payload' => [
                'method' => $this->dataService->getFilter('method'),
                'date' => $this->dataService->getFilter('date'),
                'currency' => $this->dataService->getFilter('currency'),
            ]
        ]);
    }
}
