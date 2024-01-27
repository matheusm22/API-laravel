<?php

namespace App\Http\Middleware;

use App\Models\Token;

class CheckApiToken
{
    public function handle($request, $next)
    {
        if ($request->is('api/login')) {
            // Não aplique verificação de token para a rota de login
            return $next($request);
        }

        if ($request->is('api/ativar-token')) {
            // Não aplique verificação de token para a rota de ativação de token
            return $next($request);
        }

        if ($request->is('api/desativar-token')) {
            // Não aplique verificação de token para a rota de desativação de token
            return $next($request);
        }

        // Chave do jwt
        $apiToken = $request->header('x-api-token');

        // Verificar se o token é nulo ou vazio
        if (!$apiToken) {
            return response()->json(['error' => 'Token de API não fornecido'], 401);
        }

        // Consultar o banco de dados para verificar se o token existe e está ativo
        $tokenExists = Token::where('token', $apiToken)->where('ativo', 'sim')->first();

        // Verificar se o token existe na tabela tb_tokens e está ativo
        if (!$tokenExists) {
            return response()->json(['error' => 'Token de API inválido'], 401);
        }

        // Verificar se já existe um token ativo associado ao usuário informado
        $usuario = $tokenExists->usuario;

        $tokenDoUsuario = Token::where('usuario', $usuario)->where('ativo', 'sim')->first();

        if ($tokenDoUsuario && $tokenDoUsuario->token !== $apiToken) {
            // Já existe um token ativo associado a este usuário, e não é o mesmo token atual
            return response()->json(['message' => 'Já existe um token ativo associado a este usuário']);
        }

        return $next($request);
    }
}
