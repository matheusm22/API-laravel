<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pessoa;

class PessoaController extends Controller
{
    public function index()
    {
        $pessoas = Pessoa::paginate(5); // Obtém todas as pessoas do banco de dados

        return response()->json($pessoas);
    }
}
