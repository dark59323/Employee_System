<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    protected $fillable = [
        'nombres', 'apellidos', 'cedula', 'codigo_empleado', 'direccion',
        'telefono', 'email', 'estado_civil', 'tipo_sangre', 'con_discapacidad',
        'categoria', 'provincia_id', 'foto_perfil', 'estado_aprobacion'
    ];

    public function provincia()
    {
        return $this->belongsTo(Provincia::class, 'provincia_id');
    }

    public function datosLaborales()
    {
        return $this->hasOne(DatosLaborales::class);
    }
}
