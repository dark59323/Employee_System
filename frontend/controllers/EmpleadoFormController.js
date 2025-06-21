app.controller('EmpleadoFormController', function ($scope, $http, EmpleadoService, ProvinciaService, $location) {
  $scope.tab = 'personales';
  $scope.empleado = { estado_aprobacion: 'aprobado', con_discapacidad: 'N' };
  $scope.datosLaborales = { status: 'VIGENTE' };
  $scope.provincias = [];
  $scope.previewFoto = 'assets/img/default.png';
  $scope.fotoFile = null;
  ProvinciaService.obtenerProvincias()
    .then(resp => {
      $scope.provincias = resp.data;
    })
    .catch(err => {
      console.error('Error al cargar provincias:', err);
    });
  $scope.cargarImagen = function (input) {
    const file = input.files[0];
    if (file) {
      $scope.fotoFile = file;
      const reader = new FileReader();
      reader.onload = function (e) {
        $scope.$apply(() => {
          $scope.previewFoto = e.target.result;
        });
      };
      reader.readAsDataURL(file);
    }
  };
  $scope.fechaInvalida = function () {
    if (!$scope.datosLaborales.fecha_ingreso) return false;
    const hoy = new Date().toISOString().split('T')[0];
    return $scope.datosLaborales.fecha_ingreso > hoy;
  };
  $scope.guardarEmpleado = function () {
    if ($scope.empleadoForm.$invalid || $scope.fechaInvalida()) {
      alert('Por favor corrige los errores del formulario antes de continuar.');
      return;
    }
    const isEdicion = !!$scope.empleado.id;
    const formData = new FormData();
    for (const key in $scope.empleado) {
      if ($scope.empleado[key] !== undefined && $scope.empleado[key] !== null) {
        formData.append(key, $scope.empleado[key]);
      }
    }
    if ($scope.fotoFile) {
      formData.append('foto_perfil', $scope.fotoFile);
    }
    const accionEmpleado = isEdicion
      ? EmpleadoService.actualizarEmpleadoFormData($scope.empleado.id, formData)
      : EmpleadoService.crearEmpleadoFormData(formData);
    accionEmpleado
      .then(resp => {
        const idEmpleado = resp.data.id || $scope.empleado.id;
        const datosLaborales = {
          ...$scope.datosLaborales,
          empleado_id: idEmpleado,
          fecha_ingreso: $scope.datosLaborales.fecha_ingreso
            ? new Date($scope.datosLaborales.fecha_ingreso).toISOString().split('T')[0]
            : null
        };
        if ($scope.datosLaborales.id) {
          return EmpleadoService.actualizarDatosLaborales($scope.datosLaborales.id, datosLaborales);
        } else {
          return EmpleadoService.crearDatosLaborales(datosLaborales);
        }
      })
      .then(() => {
        alert(isEdicion ? 'Empleado actualizado con éxito.' : 'Empleado creado con éxito.');
        window.location.href = '#!/';
      })
      .catch(err => {
        console.error(err);
        alert('El numero de cédula o código de empleado ya existe. Por favor, verifica los datos ingresados.');
      });
  };
  $scope.cancelar = function () {
    window.location.href = '#!/';
  };
  const idEmpleado = $location.search().id;
  console.log("ID detectado:", idEmpleado);
  if (idEmpleado) {
    EmpleadoService.obtenerEmpleadoPorId(idEmpleado)
      .then(resp => {
        const data = resp.data;
        $scope.empleado = {
          id: data.id,
          nombres: data.nombres,
          apellidos: data.apellidos,
          cedula: data.cedula,
          codigo_empleado: data.codigo_empleado,
          direccion: data.direccion,
          telefono: data.telefono,
          email: data.email,
          estado_civil: data.estado_civil,
          tipo_sangre: data.tipo_sangre,
          con_discapacidad: data.con_discapacidad,
          categoria: data.categoria,
          provincia_id: data.provincia_id,
          estado_aprobacion: data.estado_aprobacion,
          foto_perfil: data.foto_perfil
        };
        $scope.previewFoto = data.foto_perfil
          ? `http://localhost:8000/${data.foto_perfil}`
          : 'assets/img/default.png';
        if (data.datos_laborales) {
          const lab = data.datos_laborales;
          $scope.datosLaborales = {
            id: lab.id,
            division: lab.division,
            departamento: lab.departamento,
            seccion: lab.seccion,
            cargo: lab.cargo,
            fecha_ingreso: lab.fecha_ingreso ? new Date(lab.fecha_ingreso) : null,
            status: lab.status,
            sueldo: parseFloat(lab.sueldo)
          };
        }
      })
      .catch(err => {
        console.error('Error al cargar empleado:', err);
      });
  }
});