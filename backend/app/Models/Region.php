<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    protected $fillable = ['nombre_region'];

    public function provincias()
    {
        return $this->hasMany(Provincia::class, 'id_region');
    }
}
