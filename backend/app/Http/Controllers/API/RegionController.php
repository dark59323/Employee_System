<?php

namespace App\Http\Controllers\API;

use App\Models\Region;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class RegionController extends Controller
{
    public function index() {
        return Region::all();
    }

    public function store(Request $request) {
        return Region::create($request->all());
    }

    public function show($id) {
        return Region::findOrFail($id);
    }

    public function update(Request $request, $id) {
        $region = Region::findOrFail($id);
        $region->update($request->all());
        return $region;
    }

    public function destroy($id) {
        return Region::destroy($id);
    }
}
