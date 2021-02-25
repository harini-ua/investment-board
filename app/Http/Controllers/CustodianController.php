<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class CustodianController extends Controller
{
    public function index()
    {
        return Inertia::render('Custodian/Index', [
            'filters' => Request::all([]),
            'custodian' => []
        ]);
    }
}
