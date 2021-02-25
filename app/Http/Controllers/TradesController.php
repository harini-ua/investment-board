<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class TradesController extends Controller
{
    public function index()
    {
        return Inertia::render('Trades/Index', [
            'filters' => Request::all([]),
            'trades' => []
        ]);
    }
}
