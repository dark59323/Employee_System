<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\RegionController;
use App\Http\Controllers\API\ProvinciaController;
use App\Http\Controllers\API\EmpleadoController;
use App\Http\Controllers\API\DatosLaboralesController;

Route::apiResource('empleados', EmpleadoController::class);
Route::apiResource('regiones', RegionController::class);
Route::apiResource('provincias', ProvinciaController::class);
Route::apiResource('datos-laborales', DatosLaboralesController::class);