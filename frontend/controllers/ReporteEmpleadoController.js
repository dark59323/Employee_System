app.controller('ReporteEmpleadoController', function ($scope, EmpleadoService) {
  $scope.empleados = [];
  $scope.sortField = 'nombres';
  $scope.reverse = false;
  $scope.ordenarPor = function (campo) {
    if ($scope.sortField === campo) {
      $scope.reverse = !$scope.reverse;
    } else {
      $scope.sortField = campo;
      $scope.reverse = false;
    }
  };
  EmpleadoService.obtenerEmpleados()
    .then(resp => {
      $scope.empleados = resp.data;
    })
    .catch(err => {
      console.error('Error cargando reporte:', err);
      alert('No se pudo cargar el reporte de empleados.');
    });
});