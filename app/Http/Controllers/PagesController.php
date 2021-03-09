<?php

namespace App\Http\Controllers;

use Inertia\Inertia;

class PagesController extends Controller
{
    public function privacy()
    {
        return Inertia::render('Privacy/Index');
    }

    public function terms()
    {
        return Inertia::render('Terms/Index');
    }
}
