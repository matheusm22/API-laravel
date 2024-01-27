<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Token extends Model
{
    protected $table = 'tb_tokens';
    protected $primaryKey = 'id_token';
    protected $fillable = ['token', 'usuario', 'ativo','dt_atualizacao'];

    public $timestamps = false;
}
