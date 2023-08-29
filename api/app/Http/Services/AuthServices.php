<?php

namespace App\Http\Services;

use Illuminate\Support\Facades\Auth;

class AuthServices
{
    public function getAuthDetail()
    {
        return Auth::user();
    }
}
