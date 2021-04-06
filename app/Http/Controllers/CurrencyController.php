<?php

namespace App\Http\Controllers;

use App\Enums\Account;
use App\Models\Currency;
use App\Models\Custodian;
use App\Models\Portfolio;
use App\Models\User;
use App\Services\DataService;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CurrencyController extends Controller
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

        $results = Currency::data(
            $user->client_code,
            'VALUE',
            '2020-12-31',
            $user->base_currency
        );

        $currency = [];
        foreach ($results as $item) {
            $currency[$item->currency][strtolower($item->category)] = $item->value;
        }

        $currencyExposureData = [];
        $i = 0;
        foreach ($currency as $key => $item) {
            $currencyExposureData[$i] = [
                'currency' => $key,
                'cash' => $item['cash'] ?? null,
                'fx' => $item['fx'] ?? null,
                'investment' => $item['investment'] ?? null,
            ];

            $currencyExposureData[$i]['total'] =
                $currencyExposureData[$i]['cash'] +
                $currencyExposureData[$i]['fx'] +
                $currencyExposureData[$i]['investment'];

            $currencyExposureData[$i]['active'] = false;
            $currencyExposureData[$i]['grant_total'] = false;

            $i++;
        }

        $currencyHedging = [];
        foreach ($currencyExposureData as $key => $currencyExposure) {
            $currencyHedging[] = [
                'currency' => $currencyExposure['currency'],
                'gross_assets' => (($currencyExposure['cash'] + $currencyExposure['investment']) / (
                    collect($currencyExposureData)->sum('cash') + collect($currencyExposureData)->sum('investment')
                )) * 100,
                'fx' => ($currencyExposure['fx'] / (
                    collect($currencyExposureData)->sum('cash') + collect($currencyExposureData)->sum('investment')
                )) * 100,
                'net_assets' => ($currencyExposure['total'] / collect($currencyExposureData)->sum('total')) * 100,
                'active' => false,
                'total' => false,
            ];
        }

        $currencyHedging[] = [
            'currency' => 'Total',
            'gross_assets' => collect($currencyHedging)->sum('gross_assets'),
            'fx' => collect($currencyHedging)->sum('fx'),
            'net_assets' => collect($currencyHedging)->sum('net_assets'),
            'active' => false,
            'total' => true,
        ];

        $currencyExposureCart = [];
        foreach ($currencyExposureData as $key => $item) {
            $currencyExposureCart[] = [
                'currency' => $item['currency'],
                'percentage' => round($item['total'] / collect($currencyExposureData)->sum('total') * 100, 2)
            ];
        }

        $currencyExposureData[] = [
            'currency' => 'Total',
            'fx' => collect($currencyExposureData)->sum('fx'),
            'cash' => collect($currencyExposureData)->sum('cash'),
            'investment' => collect($currencyExposureData)->sum('investment'),
            'total' => collect($currencyExposureData)->sum('total'),
            'grant_total' => true,
            'active' => false,
        ];

        return Inertia::render('Currency/Index', [
            'filters' => Request::all(['method', 'date', 'currency', 'asset_class', 'custodian', 'account']),
            'currencyExposureCart' => $currencyExposureCart,
            'currencyExposureData' => $currencyExposureData,
            'currencyHedging' => $currencyHedging,
            'payload' => [
                'method' => $this->dataService->getValuationMethod(),
                'date' => '2020-12-31',
                'currency' => $this->dataService->getBaseCurrency(),
                'asset_class' => Portfolio::assetClass(),
                'custodian' => Custodian::names(),
                'account' => Account::toCollection(true)
            ]
        ]);
    }
}
