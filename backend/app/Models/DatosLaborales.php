<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DatosLaborales extends Model
{
    protected $fillable = [
        'empleado_id', 'division', 'departamento', 'seccion',
        'cargo', 'fecha_ingreso', 'status', 'sueldo'
    ];

    public function empleado()
    {
        return $this->belongsTo(Empleado::class, 'empleado_id');
    }
}
