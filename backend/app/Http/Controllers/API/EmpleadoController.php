<?php

namespace App\Http\Controllers\API;

use App\Models\Empleado;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log; 

class EmpleadoController extends Controller
{
    public function index()
    {
        return Empleado::with(['provincia', 'datosLaborales'])->get();
    }

    public function store(Request $request)
    {
        Log::info('Request recibido', $request->except('foto_perfil'));

        if ($request->hasFile('foto_perfil')) {
            Log::info('Archivo recibido:', [$request->file('foto_perfil')->getClientOriginalName()]);
        } else {
            Log::warning('No se recibió archivo foto_perfil');
        }

        $empleado = Empleado::create($request->except('foto_perfil'));

        if ($request->hasFile('foto_perfil')) {
            $file = $request->file('foto_perfil');
            $filename = time() . '_' . $file->getClientOriginalName();
            $file->move(public_path('fotos'), $filename);
            $empleado->foto_perfil = 'fotos/' . $filename;
            $empleado->save();
        }

        return response()->json($empleado, 201);
    }



    public function show($id)
    {
        return Empleado::with(['provincia', 'datosLaborales'])->findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $empleado = Empleado::findOrFail($id);
        $empleado->update($request->except('foto_perfil'));

        if ($request->hasFile('foto_perfil')) {
            $file = $request->file('foto_perfil');
            $filename = time() . '_' . $file->getClientOriginalName();
            $file->move(public_path('fotos'), $filename);
            $empleado->foto_perfil = 'fotos/' . $filename;
            $empleado->save();
        }

        return response()->json($empleado);
    }


    public function destroy($id)
    {
        return Empleado::destroy($id);
    }
}
