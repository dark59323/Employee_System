app.factory('ProvinciaService', function ($http) {
  const API_URL = 'http://localhost:8000/api';

  return {
    obtenerProvincias: () => $http.get(`${API_URL}/provincias`)
  };
});