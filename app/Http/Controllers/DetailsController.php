<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use Inertia\Inertia;

class DetailsController extends Controller
{
    public function index()
    {
        return Inertia::render('Details/Index', [
            'filters' => Request::all([]),
            'details' => []
        ]);
    }
}
