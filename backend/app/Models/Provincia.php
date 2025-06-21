<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Provincia extends Model
{
    protected $fillable = [
        'nombre_provincia', 'capital_provincia', 'descripcion_provincia',
        'poblacion_provincia', 'superficie_provincia', 'latitud_provincia',
        'longitud_provincia', 'id_region'
    ];

    public function region()
    {
        return $this->belongsTo(Region::class, 'id_region');
    }

    public function empleados()
    {
        return $this->hasMany(Empleado::class, 'provincia_id');
    }
}
