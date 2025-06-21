app.factory('EmpleadoService', function ($http) {
  const API_URL = 'http://localhost:8000/api';

  return {
    obtenerEmpleados: () => $http.get(`${API_URL}/empleados`),
    obtenerEmpleadoPorId: (id) => $http.get(`${API_URL}/empleados/${id}`),
    crearEmpleado: (empleado) => $http.post(`${API_URL}/empleados`, empleado),
    actualizarEmpleado: (id, empleado) => $http.put(`${API_URL}/empleados/${id}`, empleado),
    obtenerDatosLaborales: (id) => $http.get(`${API_URL}/datos-laborales/${id}`),
    crearDatosLaborales: (datos) => $http.post(`${API_URL}/datos-laborales`, datos),
    actualizarDatosLaborales: (id, datos) => $http.put(`${API_URL}/datos-laborales/${id}`, datos),
    crearEmpleadoFormData: (formData) => $http.post(`${API_URL}/empleados`, formData, {
      headers: { 'Content-Type': undefined },
      transformRequest: angular.identity
    }),
    actualizarEmpleadoFormData: (id, formData) => $http.post(`${API_URL}/empleados/${id}?_method=PUT`, formData, {
      headers: { 'Content-Type': undefined },
      transformRequest: angular.identity
    })
  };
});