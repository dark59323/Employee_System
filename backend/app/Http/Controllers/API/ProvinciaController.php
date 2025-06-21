<?php

namespace App\Http\Controllers\API;

use App\Models\Provincia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProvinciaController extends Controller
{
    public function index() {
        return Provincia::with('region')->get();
    }

    public function store(Request $request) {
        return Provincia::create($request->all());
    }

    public function show($id) {
        return Provincia::with('region')->findOrFail($id);
    }

    public function update(Request $request, $id) {
        $provincia = Provincia::findOrFail($id);
        $provincia->update($request->all());
        return $provincia;
    }

    public function destroy($id) {
        return Provincia::destroy($id);
    }
}
