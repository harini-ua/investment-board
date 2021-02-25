<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CurrencyController extends Controller
{
    public function index()
    {
        return Inertia::render('Currency/Index', [
            'filters' => Request::all([]),
            'currency' => []
        ]);
    }
}
