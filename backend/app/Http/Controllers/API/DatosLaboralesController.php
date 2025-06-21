<?php

namespace App\Http\Controllers\API;

use App\Models\DatosLaborales;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DatosLaboralesController extends Controller
{
    public function index() {
        return DatosLaborales::with('empleado')->get();
    }

    public function store(Request $request) {
        return DatosLaborales::create($request->all());
    }

    public function show($id) {
        return DatosLaborales::with('empleado')->findOrFail($id);
    }

    public function update(Request $request, $id) {
        $datos = DatosLaborales::findOrFail($id);
        $datos->update($request->all());
        return $datos;
    }

    public function destroy($id) {
        return DatosLaborales::destroy($id);
    }
}
