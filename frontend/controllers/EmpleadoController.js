app.controller('EmpleadoController', function ($scope, $http, EmpleadoService) {
    $scope.empleados = [];
    $scope.inputNombre = '';
    $scope.inputCodigo = '';
    $scope.filtroNombre = '';
    $scope.filtroCodigo = '';
    $scope.limite = 20;
    $scope.buscar = function () {
        $scope.filtroNombre = $scope.inputNombre.toLowerCase();
        $scope.filtroCodigo = $scope.inputCodigo.toLowerCase();
        $scope.limite = 1000;
    };
    $scope.filtroBusqueda = function (empleado) {
        let nombre = (empleado.nombres + ' ' + empleado.apellidos).toLowerCase();
        let codigo = (empleado.codigo_empleado || '').toLowerCase();
        let coincide = nombre.includes($scope.filtroNombre) && codigo.includes($scope.filtroCodigo);
        if (!$scope.filtroNombre && !$scope.filtroCodigo) $scope.limite = 20;
        return coincide;
    };
    EmpleadoService.obtenerEmpleados()
        .then(response => $scope.empleados = response.data)
        .catch(error => console.error('Error al cargar empleados:', error));
    $scope.crearEmpleado = function () {
        window.location.href = '#!/crear-empleado';
    };
    $scope.generarReporte = function () {
        window.location.href = '#!/reporte-empleado';
    };
    $scope.salir = function () {
        window.location.href = '#!/gracias';
    };
    $scope.empleadoSeleccionado = null;
    $scope.seleccionarEmpleado = function (empleado) {
        $scope.empleadoSeleccionado = empleado;
    };
    $scope.editarEmpleado = function (empleado) {
        window.location.href = `#!/crear-empleado?id=${empleado.id}`;
    };
});
