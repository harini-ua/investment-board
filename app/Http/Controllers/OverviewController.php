<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class OverviewController extends Controller
{
    public function index()
    {
        return Inertia::render('Overview/Index', [
            'filters' => Request::all([]),
            'currency' => []
        ]);
    }
}
