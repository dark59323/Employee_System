# 🧾 Sistema de Gestión de Empleados

Este sistema permite gestionar la información personal y laboral de empleados, con un backend en Laravel, un frontend en AngularJS + Bootstrap 4 y una base de datos en MySQL. Todo corre sobre Docker.

---

## 🚀 Tecnologías Utilizadas

- **Backend**: Laravel 10 (API RESTful)
- **Frontend**: AngularJS 1.8 + Bootstrap 4
- **Base de datos**: MySQL 8
- **Contenedores**: Docker + Docker Compose
- **Servidor web frontend**: Nginx (alpine)

---

## 🧠 Funcionalidades

### 📋 Empleados
- Crear, listar y editar.
- Para editar puede darle doble click en la persona de la pantalla principal o darle un click para seleccionarle y aplastar en el boton "Editar".
- División de datos en:
  - **Personales**: nombres, cédula, email, provincia, foto.
  - **Laborales**: división, departamento, cargo, sueldo, fecha ingreso.

### 🔍 Listado con filtros
- Buscar por nombre o código.
- Limitar resultados (20 por defecto, 1000 al buscar).
- Botón de selección de empleado para editar.

### 📷 Foto de perfil
- Vista previa de imagen antes de guardar.
- Se almacena en `public/fotos/` y se referencia desde AngularJS.
- Se mantiene la foto previa al editar si no se cambia.

### 📤 Validaciones
- Todos los campos requeridos tienen validación.
- Cédula y teléfono con exactamente 10 dígitos.
- Correo validado paar que se ingrese un correo real.
- No se puede registrar a una persona con la misma cedula o codigo del empleado, en caso de hacerlo no le dejara editar o agregar.

### 🖥 Pantallas
- `crear-empleado`: formulario con pestañas.
- `reporte-empleado`: vista para imprimir o exportar.
- `gracias`: mensaje final al salir.

---

## ⚙️ Configuración Docker

### `docker-compose.yml`
```yaml
version: '3.8'

services:
  laravel:
    build:
      context: ./backend
      dockerfile: Dockerfile
    container_name: laravel-app
    ports:
      - 8000:8000
    volumes:
      - ./backend:/var/www/html
    depends_on:
      - mysql

  mysql:
    image: mysql:8
    container_name: mysql-db
    restart: always
    environment:
      MYSQL_DATABASE: empleadosdb
      MYSQL_ROOT_PASSWORD: root
      MYSQL_USER: dark
      MYSQL_PASSWORD: Dark230900.
    ports:
      - 3306:3306
    volumes:
      - mysql_data:/var/lib/mysql
      - ./db:/docker-entrypoint-initdb.d

  frontend:
    build:
      context: ./frontend
      dockerfile: Dockerfile
    container_name: angularjs-frontend
    ports:
      - 8080:80
    volumes:
      - ./frontend:/usr/share/nginx/html:ro
    depends_on:
      - laravel

volumes:
  mysql_data:
```

### `frontend/Dockerfile`
```dockerfile
FROM nginx:alpine
COPY . /usr/share/nginx/html
```

---

## 📦 Uso

1. Clona el repositorio:
   ```bash
   git clone https://github.com/dark59323/Employee_System.git
   cd Employee_System
   ```

2. Levanta el sistema con Docker:
   ```bash
   docker-compose up --build
   ```

3. Accede:
   - Frontend: [http://localhost:8080](http://localhost:8080)
   - API Laravel: [http://localhost:8000/api/empleados](http://localhost:8000/api/empleados)

---

## ✍️ Autor

**Danny Quingaluisa**


