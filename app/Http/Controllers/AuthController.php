<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Token;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $nome = $request->input('usuario');

        // Consultar o banco de dados para verificar se o usuário existe
        $usuario = Token::where('usuario', $nome)->first();

        // Verificar se o usuário existe
        if (!$usuario) {
            return response()->json(['error' => 'Usuário não encontrado'], 401);
        }

        // Verificar se o token associado ao usuário está ativo
        if ($usuario->ativo === 'nao') {
            return response()->json(['error' => 'O token está desativado.'], 401);
        }

        // Se o token associado ao usuário é null, criar um novo token
        if ($usuario->token === null) {
            // Gerar um novo token de autenticação
            $apiToken = generateApiToken();

            // Atualizar a tabela tb_tokens com o novo token
            $usuario->update(['token' => $apiToken, 'ativo' => 'sim']);

            return response()->json(['token' => $apiToken]);
        }

        // Se o token não é null e está ativo, retornar uma mensagem indicando que o token está ativo
        return response()->json(['error' => 'Já existe um token ativo associado a este usuário', 'token' => $usuario->token], 401);
    }

    public function desativarToken(Request $request)
{
    $nome = $request->input('usuario');

    // Verificar se o usuário existe
    $usuario = Token::where('usuario', $nome)->first();

    if (!$usuario) {
        return response()->json(['error' => 'Usuário inválido'], 401);
    }

    // Desativar o token (definir 'ativo' para 'nao')
    Token::where('usuario', $nome)->update(['ativo' => 'nao']);

    return response()->json(['message' => 'Token desativado com sucesso']);
}

    public function ativarToken(Request $request)
    {
        $nome = $request->input('usuario');

        // Verificar se o usuário existe
        $usuario = Token::where('usuario', $nome)->first();

        if (!$usuario) {
            return response()->json(['error' => 'Usuário inválido'], 401);
        }

        // Desativar o token (definir 'ativo' para 'sim')
        Token::where('usuario', $nome)->update(['ativo' => 'sim']);

        return response()->json(['message' => 'Token ativado com sucesso']);
    }
}
function generateApiToken()
{
    return Str::random(60);
}
