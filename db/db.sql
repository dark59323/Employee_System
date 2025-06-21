/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS datos_laborales;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS provincias;
DROP TABLE IF EXISTS regions;


CREATE TABLE regions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_region VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE provincias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_provincia VARCHAR(100),
    capital_provincia VARCHAR(100),
    descripcion_provincia TEXT,
    poblacion_provincia VARCHAR(50),
    superficie_provincia VARCHAR(50),
    latitud_provincia VARCHAR(50),
    longitud_provincia VARCHAR(50),
    id_region INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_region) REFERENCES regions(id) ON DELETE CASCADE
);


CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) NOT NULL UNIQUE,
    codigo_empleado VARCHAR(20) UNIQUE,
    direccion TEXT,
    telefono VARCHAR(20),
    email VARCHAR(100),
    estado_civil VARCHAR(50),
    tipo_sangre VARCHAR(5),
    con_discapacidad ENUM('SI', 'NO') DEFAULT 'NO',
    categoria VARCHAR(100),
    provincia_id INT,
    foto_perfil VARCHAR(255),
    estado_aprobacion ENUM('pendiente', 'aprobado', 'rechazado') DEFAULT 'aprobado',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (provincia_id) REFERENCES provincias(id) ON DELETE CASCADE
);


CREATE TABLE datos_laborales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT NOT NULL,
    division VARCHAR(100),
    departamento VARCHAR(100),
    seccion VARCHAR(100),
    cargo VARCHAR(100),
    fecha_ingreso DATE,
    status ENUM('VIGENTE', 'RETIRADO') DEFAULT 'VIGENTE',
    sueldo DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id) ON DELETE CASCADE
);


INSERT INTO regions (nombre_region) VALUES
('Sierra'),
('Costa'),
('Insular'),
('Amazonía');


INSERT INTO provincias (nombre_provincia, capital_provincia, descripcion_provincia, poblacion_provincia, superficie_provincia, latitud_provincia, longitud_provincia, id_region, created_at, updated_at) VALUES
('Azuay','Cuenca','Es llamada la Atenas del Ecuador...', '569.42','122.00','-2.902222','-79.005261',1, NOW(), NOW()),
('Bolivar','Guaranda','Bolívar es una provincia del centro de Ecuador...', '183641','3254.00','-1.6','-79',1, NOW(), NOW()),
('Cañar','Azoguez','La provincia destaca como uno de los sitios turísticos más importantes...', '33848.00','3908.00','-2.733333','-78.833333',1, NOW(), NOW()),
('Carchi','Tulcán','Carchi es una provincia ecuatoriana situada al norte...', '82734.00','3783.00','0.811667','-77.718611',1, NOW(), NOW()),
('Chimborazo','Riobamba','En esta provincia se encuentran varias de las cumbres más elevadas...', '223586.00','6487.00','-1.666667','-78.65',1, NOW(), NOW()),
('Cotopaxi','Latacunga','La provincia toma el nombre del volcán más grande e importante...', '409205','6569.00','-0.933333','-78.616667',1, NOW(), NOW()),
('El Oro','Machala','La capital de la provincia de El Oro es la ciudad de Machala...', '260528.00','6188.00','-3.266669','-79.9667',2, NOW(), NOW()),
('Esmeraldas','Esmeraldas','Provincia del Ecuador situada en su costa noroccidental...', '189504.00','15954','-0.966667','-79.65',2, NOW(), NOW()),
('Galápagos','P. Baquerizo Moreno','Es el mayor centro turístico del Ecuador...', '5600.00','8010.00','-0.666667','-90.55',3, NOW(), NOW()),
('Guayas','Guayaquil','Es el mayor centro comercial e industrial del Ecuador...', '2526927.00','17139.00','-2.2','-79.9667',2, NOW(), NOW()),
('Imbabura','Ibarra','La provincia también es conocida por sus contrastes poblacionales...', '181722.00','4599.00','0.35','-78.133333',1, NOW(), NOW()),
('Loja','Loja','Loja es una ciudad del Ecuador, conocida como la capital musical...', '206.83','57.00','-3.833','-80.067',1, NOW(), NOW()),
('Los Rios','Babahoyo','Provincia agrícola muy importante del Ecuador...', '778115.00','6254.00','-1.766669','-79.45',2, NOW(), NOW()),
('Manabí','Portoviejo','Ubicada en la costa centro-noroeste de Ecuador...', '1369780.00','18400.00','-1.052219','-80.4506',2, NOW(), NOW()),
('Morona Santiago','MacaSI','Provincia amazónica, rica en cultura indígena y biodiversidad...', '147940.00','25690.00','-2.366667','-78.133333',4, NOW(), NOW()),
('Napo','Tena','Ubicada en la región amazónica e incluyendo laderas andinas...', '103697.00','13271.00','0.989','-77.8159',4, NOW(), NOW()),
('Orellana','Francisco de Orellana','Provincia amazónica reciente, rica en biodiversidad...', '136396.00','20773.00','-0.933333','-75.666667',4, NOW(), NOW()),
('Pastaza','Puyo','Ubicada en la Amazonía del Ecuador, con extensas áreas naturales...', '83933.00','29520.00','-1.066667','-78.001111',4, NOW(), NOW()),
('Pichincha','Quito','Capital de Ecuador, principal centro político y comercial...', '2576287.00','9612.00','-0.25','-78.583333',1, NOW(), NOW()),
('Santa Elena','Santa Elena','Provincia costera creada en 2007...', '308693.00','3763.00','-2.2267','-80.8583',2, NOW(), NOW()),
('Santo Domingo de los Tsáchilas','Santo Domingo','Provincia en zona de trópico húmedo, con población tsáchila...', '410937.00','4180.00','-0.333333','-79.25',2, NOW(), NOW()),
('Sucumbios','Nueva Loja','Provincia petrolera del nororiente del Ecuador...', '176472.00','18612.00','-0.083333','-76.883333',4, NOW(), NOW()),
('Tungurahua','Ambato','Provincia serrana, con la ciudad de Ambato como centro administrativo...', '504583.00','3334.00','-1.233333','-78.616667',1, NOW(), NOW()),
('Zamora Chimchipe','Zamora','Provincia amazónica con orografía montañosa única...', '91376.00','10556.00','-2.883333','-79',4, NOW(), NOW());


INSERT INTO empleados (nombres, apellidos, cedula, codigo_empleado, direccion, telefono, email, estado_civil, tipo_sangre, con_discapacidad, categoria, provincia_id, foto_perfil, estado_aprobacion, created_at, updated_at) VALUES 
('Danny', 'Pérez', '0102030405', 'EMP001', 'Av. Siempre Viva 123', '0991234567', 'juan.perez@example.com', 'SOLTERO', 'O+', 'NO', 'Administrativo', 1, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('María', 'González', '0203040506', 'EMP002', 'Calle Falsa 456', '0987654321', 'maria.gonzalez@example.com', 'CASADO', 'A+', 'NO', 'Técnico', 2, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Carlos', 'Ramírez', '0304050607', 'EMP003', 'Av. Quito 789', '0976543210', 'carlos.ramirez@example.com', 'DIVORCIADO', 'B-', 'SI', 'Operativo', 3, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Ana', 'Lopez', '0405060708', 'EMP004', 'Cdla. El Bosque', '0965432109', 'ana.lopez@example.com', 'SOLTERO', 'AB+', 'NO', 'Administrativo', 4, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Luis', 'Mendoza', '0506070809', 'EMP005', 'Barrio Central', '0954321098', 'luis.mendoza@example.com', 'VIUDO', 'O-', 'SI', 'Técnico', 5, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Laura', 'Martínez', '0607080910', 'EMP006', 'Calle Bolívar 789', '0934567890', 'laura.martinez@example.com', 'SOLTERO', 'A-', 'NO', 'Administrativo', 6, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Andrés', 'Suárez', '0708091011', 'EMP007', 'Av. Amazonas 100', '0923456789', 'andres.suarez@example.com', 'CASADO', 'O+', 'SI', 'Técnico', 7, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Diana', 'Castro', '0809101112', 'EMP008', 'Cdla. Kennedy', '0912345678', 'diana.castro@example.com', 'SOLTERO', 'B+', 'NO', 'Operativo', 8, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Mario', 'Gómez', '0901011213', 'EMP009', 'El Inca y 6 de Diciembre', '0998765432', 'mario.gomez@example.com', 'DIVORCIADO', 'AB-', 'NO', 'Administrativo', 9, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Jessica', 'Núñez', '1001121314', 'EMP010', 'Cdla. La Floresta', '0987654321', 'jessica.nunez@example.com', 'CASADO', 'O+', 'SI', 'Técnico', 10, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Eduardo', 'Cabrera', '1102131415', 'EMP011', 'Barrio El Dorado', '0976543210', 'eduardo.cabrera@example.com', 'SOLTERO', 'A+', 'NO', 'Operativo', 11, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Patricia', 'Paredes', '1203141516', 'EMP012', 'Cdla. El BatáNO', '0965432109', 'patricia.paredes@example.com', 'CASADO', 'O-', 'NO', 'Administrativo', 12, 'fotos/todo.jpeg.jpg', 'aprobado', NOW(), NOW()),
('Julio', 'Torres', '1304151617', 'EMP013', 'San Rafael Norte', '0954321098', 'julio.torres@example.com', 'VIUDO', 'AB+', 'SI', 'Técnico', 13, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Natalia', 'Rojas', '1405161718', 'EMP014', 'Cdla. MirafloreSI', '0943210987', 'natalia.rojas@example.com', 'SOLTERO', 'B-', 'NO', 'Operativo', 14, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Daniel', 'Ortiz', '1506171819', 'EMP015', 'El Condado Alto', '0932109876', 'daniel.ortiz@example.com', 'CASADO', 'O+', 'SI', 'Técnico', 15, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Rosa', 'Acosta', '1607181920', 'EMP016', 'Cdla. 10 de Agosto', '0921098765', 'rosa.acosta@example.com', 'SOLTERO', 'A-', 'NO', 'Administrativo', 16, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Jorge', 'López', '1708192021', 'EMP017', 'Cdla. San CarloSI', '0910987654', 'jorge.lopez@example.com', 'DIVORCIADO', 'B+', 'NO', 'Técnico', 17, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Carmen', 'Vega', '1809202122', 'EMP018', 'Cdla. El Recreo', '0909876543', 'carmen.vega@example.com', 'VIUDO', 'O-', 'SI', 'Operativo', 18, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Pedro', 'Salazar', '1901022223', 'EMP019', 'Av. 6 de Diciembre y Gaspar', '0998765432', 'pedro.salazar@example.com', 'SOLTERO', 'AB-', 'NO', 'Administrativo', 19, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Lucía', 'Muñoz', '2002032324', 'EMP020', 'Cdla. La Primavera', '0987654321', 'lucia.munoz@example.com', 'CASADO', 'O+', 'NO', 'Técnico', 20, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Oscar', 'Flores', '2103042425', 'EMP021', 'Cdla. La Argelia', '0976543210', 'oscar.flores@example.com', 'SOLTERO', 'B+', 'SI', 'Operativo', 21, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Sofía', 'Herrera', '2204052526', 'EMP022', 'Cdla. San Bartolo', '0965432109', 'sofia.herrera@example.com', 'SOLTERO', 'O-', 'NO', 'Administrativo', 22, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Héctor', 'Mejía', '2305062627', 'EMP023', 'Cdla. MonjaSI', '0954321098', 'hector.mejia@example.com', 'CASADO', 'AB+', 'NO', 'Técnico', 23, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Verónica', 'Sánchez', '2406072728', 'EMP024', 'Cdla. Los ChilloSI', '0943210987', 'veronica.sanchez@example.com', 'DIVORCIADO', 'A-', 'SI', 'Operativo', 24, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Marco', 'Navarrete', '2507082829', 'EMP025', 'Cdla. Valle de los ChilloSI', '0932109876', 'marco.navarrete@example.com', 'VIUDO', 'O+', 'NO', 'Administrativo', 24, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Paola', 'Silva', '2608092930', 'EMP026', 'Cdla. Pomasqui', '0921098765', 'paola.silva@example.com', 'SOLTERO', 'B-', 'NO', 'Técnico', 1, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Diego', 'Zambrano', '2709103031', 'EMP027', 'Cdla. El Inca', '0910987654', 'diego.zambrano@example.com', 'CASADO', 'A+', 'SI', 'Operativo', 2, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Isabel', 'Bravo', '2801013132', 'EMP028', 'Cdla. La Kennedy', '0909876543', 'isabel.bravo@example.com', 'SOLTERO', 'AB-', 'NO', 'Administrativo', 3, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Ricardo', 'Palacios', '2902023233', 'EMP029', 'Cdla. La Ferroviaria', '0998765432', 'ricardo.palacios@example.com', 'DIVORCIADO', 'O+', 'SI', 'Técnico', 4, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW()),
('Andrea', 'Chávez', '3003033334', 'EMP030', 'Cdla. Turubamba', '0987654321', 'andrea.chavez@example.com', 'SOLTERO', 'B+', 'NO', 'Operativo', 5, 'fotos/todo.jpeg', 'aprobado', NOW(), NOW());


INSERT INTO datos_laborales (empleado_id, division, departamento, seccion, cargo, fecha_ingreso, status, sueldo, created_at, updated_at) VALUES 
(1, 'Quito Norte', 'Recursos Humanos', 'Contratación', 'Analista RRHH', '2022-01-15', 'VIGENTE', 1200.00, NOW(), NOW()),
(2, 'Guayaquil Sur', 'Sistemas', 'Soporte Técnico', 'Técnico de Soporte', '2021-06-01', 'VIGENTE', 1000.00, NOW(), NOW()),
(3, 'Cuenca Centro', 'Producción', 'Línea 3', 'Operador de Máquina', '2020-03-20', 'RETIRADO', 850.00, NOW(), NOW()),
(4, 'Quito Centro', 'Finanzas', 'Presupuestos', 'Asistente Financiero', '2023-04-10', 'VIGENTE', 1300.00, NOW(), NOW()),
(5, 'Loja Norte', 'Mantenimiento', 'Electromecánica', 'Técnico Electricista', '2019-11-05', 'VIGENTE', 950.00, NOW(), NOW()),
(6, 'Quito Norte', 'Mantenimiento', 'Contratación', 'Analista RRHH', '2019-07-07', 'RETIRADO', 827.67, NOW(), NOW()),
(7, 'Ambato Este', 'Recursos Humanos', 'Electromecánica', 'Supervisor de Planta', '2020-08-08', 'VIGENTE', 972.33, NOW(), NOW()),
(8, 'Guayaquil Sur', 'Finanzas', 'Presupuestos', 'Desarrollador Backend', '2021-09-09', 'RETIRADO', 876.65, NOW(), NOW()),
(9, 'Esmeraldas Sur', 'Sistemas', 'Electromecánica', 'Técnico de Soporte', '2022-10-10', 'RETIRADO', 1099.03, NOW(), NOW()),
(10, 'Guayaquil Sur', 'Sistemas', 'Contratación', 'Técnico de Soporte', '2018-11-11', 'RETIRADO', 873.39, NOW(), NOW()),
(11, 'Ambato Este', 'Mantenimiento', 'Soporte Técnico', 'Técnico Electricista', '2019-12-12', 'VIGENTE', 1066.54, NOW(), NOW()),
(12, 'Ibarra Centro', 'Mantenimiento', 'Electromecánica', 'Asistente Financiero', '2020-01-13', 'VIGENTE', 1378.86, NOW(), NOW()),
(13, 'Ibarra Centro', 'Sistemas', 'Línea 3', 'Auditor Interno', '2021-02-14', 'VIGENTE', 829.06, NOW(), NOW()),
(14, 'Esmeraldas Sur', 'Finanzas', 'Línea 3', 'Supervisor de Planta', '2022-03-15', 'RETIRADO', 816.58, NOW(), NOW()),
(15, 'Loja Norte', 'Mantenimiento', 'Soporte Técnico', 'Técnico Electricista', '2018-04-16', 'RETIRADO', 1186.84, NOW(), NOW()),
(16, 'Guayaquil Sur', 'Finanzas', 'Línea 3', 'Auditor Interno', '2019-05-17', 'VIGENTE', 1218.89, NOW(), NOW()),
(17, 'Manta Norte', 'Mantenimiento', 'Contratación', 'Supervisor de Planta', '2020-06-18', 'RETIRADO', 920.35, NOW(), NOW()),
(18, 'Cuenca Centro', 'Mantenimiento', 'Soporte Técnico', 'Técnico de Soporte', '2021-07-19', 'VIGENTE', 1497.87, NOW(), NOW()),
(19, 'Riobamba Oeste', 'Recursos Humanos', 'Línea 3', 'Asistente Financiero', '2022-08-20', 'VIGENTE', 948.56, NOW(), NOW()),
(20, 'Ambato Este', 'Sistemas', 'Línea 3', 'Auditor Interno', '2018-09-21', 'RETIRADO', 1274.02, NOW(), NOW()),
(21, 'Loja Norte', 'Mantenimiento', 'Contratación', 'Técnico de Soporte', '2019-10-22', 'RETIRADO', 1384.57, NOW(), NOW()),
(22, 'Loja Norte', 'Mantenimiento', 'Soporte Técnico', 'Operador de Máquina', '2020-11-23', 'RETIRADO', 879.09, NOW(), NOW()),
(23, 'Quito Norte', 'Mantenimiento', 'Electromecánica', 'Operador de Máquina', '2021-12-24', 'VIGENTE', 1362.23, NOW(), NOW()),
(24, 'Ibarra Centro', 'Mantenimiento', 'Electromecánica', 'Técnico Electricista', '2022-01-25', 'RETIRADO', 1251.65, NOW(), NOW()),
(25, 'Quito Norte', 'Finanzas', 'Electromecánica', 'Desarrollador Backend', '2018-02-26', 'VIGENTE', 977.48, NOW(), NOW()),
(26, 'Esmeraldas Sur', 'Finanzas', 'Contratación', 'Asistente Financiero', '2019-03-27', 'VIGENTE', 1316.18, NOW(), NOW()),
(27, 'Quito Norte', 'Recursos Humanos', 'Electromecánica', 'Técnico Electricista', '2020-04-28', 'VIGENTE', 1258.21, NOW(), NOW()),
(28, 'Esmeraldas Sur', 'Mantenimiento', 'Soporte Técnico', 'Operador de Máquina', '2021-05-01', 'RETIRADO', 1130.32, NOW(), NOW()),
(29, 'Quito Centro', 'Producción', 'Contratación', 'Operador de Máquina', '2022-06-02', 'RETIRADO', 1463.82, NOW(), NOW()),
(30, 'Guayaquil Sur', 'Mantenimiento', 'Línea 3', 'Técnico Electricista', '2018-07-03', 'RETIRADO', 969.2, NOW(), NOW());