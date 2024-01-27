<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PessoaController;

Route::get('/ativar-token', [AuthController::class, 'ativarToken']);
Route::get('/desativar-token', [AuthController::class, 'desativarToken']);
Route::get('/login', [AuthController::class, 'login']);


// Rotas protegidas por autenticação JWT e validação de token
Route::middleware(['CheckApiToken'])->group (function () {
    Route::get('/pessoas', [PessoaController::class, 'index']);
});