<?php

namespace App\Http\Controllers;

use App\Enums\BaseCurrency;
use App\Enums\ValuationMethod;
use App\Services\DataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CustodianController extends Controller
{
    /** @var DataService $dataService */
    protected $dataService;

    /**
     * CustodianController constructor.
     *
     * @param DataService $dataService
     */
    public function __construct(DataService $dataService)
    {
        $this->dataService = $dataService;
    }

    public function index()
    {
        $results = $this->dataService->getCustodian('DUM', '2020-12-31', 'EUR', 'VALUE');
        $results = collect($results)->groupBy('custodian_name');

        $custodians = [];
        $i = 0;
        foreach ($results as $name => $custodian) {
            $custodians[$i] = [
                'custodian_name' => $name,
                'value' => $custodian->sum('value'),
                'active' => false,
            ];

            foreach ($custodian as  $item) {
                $sum = $custodians[$i]['value'];
                $custodians[$i]['asset'][$item->kfp_asset_class] = [
                    'percentage' => round( $item->value / $sum * 100, 2),
                    'value' => $item->value,
                ];
            }
            $i++;
        }

        return Inertia::render('Custodian/Index', [
            'filters' => Request::all(['method', 'date', 'currency']),
            'custodians' => $custodians,
            'payload' => [
                'method' => ValuationMethod::toCollection(),
                'currency' => BaseCurrency::getKeys(),
            ]
        ]);
    }
}
