<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Services\CustodianDataService;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CustodianController extends Controller
{
    public const FILTER_FIELDS = [
        'method', 'date', 'currency'
    ];

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

    /**
     * @param Request $request
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

        return Inertia::render('Custodian/Index', [
            'filters' => $request->only($fields),
            'custodians' => $this->dataService->custodians(),
            'payload' => [
                'method' => $this->dataService->getFilter('method'),
                'date' => $this->dataService->getFilter('date'),
                'currency' => $this->dataService->getFilter('currency'),
            ]
        ]);
    }
}
