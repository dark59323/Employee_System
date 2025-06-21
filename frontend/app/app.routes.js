app.config(function($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'views/index.html',
      controller: 'EmpleadoController'
    })
    .when('/crear-empleado', {
      templateUrl: 'views/crear-empleado.html',
      controller: 'EmpleadoFormController'
    })
    .when('/reporte-empleado', {
      templateUrl: 'views/reporte-empleado.html',
      controller: 'ReporteEmpleadoController'
    })
    .when('/gracias', {
      templateUrl: 'views/gracias.html'
    })
    .otherwise({
      redirectTo: '/'
    });
});