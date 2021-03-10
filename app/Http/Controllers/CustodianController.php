<?php

namespace App\Http\Controllers;

use App\Enums\BaseCurrency;
use App\Enums\ValuationMethod;
use App\Models\Custodian;
use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CustodianController extends Controller
{
    public function index()
    {
//        $custodian = Custodian::data(null, Request::get('method'), Request::get('date'), Request::get('currency'));

        return Inertia::render('Custodian/Index', [
            'filters' => Request::all(['method', 'date', 'currency']),
            'custodian' => [],
            'payload' => [
                'method' => ValuationMethod::toCollection(),
                'currency' => BaseCurrency::getKeys(),
            ]
        ]);
    }
}
