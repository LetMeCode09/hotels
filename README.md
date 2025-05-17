# 🏨 Hotels - Web Management App

Aplicación web de gestión hotelera desarrollada con Java, JSP, Servlets y MySQL/MariaDB. Permite gestionar usuarios, habitaciones, reservas y más, diferenciando roles de administrador y usuario.

## 🚀 Tecnologías utilizadas

- Java 17+
- JSP + Servlets
- JDBC
- MariaDB / MySQL
- Apache Tomcat 9
- Bootstrap 5
- Maven

## 🧩 Estructura del proyecto

Hotels/
src/
com.svalero.hotels.model # Modelos Java: User, Room, Booking
com.svalero.hotels.dao # Acceso a datos (DAOs)
om.svalero.hotels.servlet # Servlets principales
com.svalero.hotels.database # Clase Database (conexión)
WebContent/
includes/ # JSPs comunes: header, navbar, footer
css/ # Estilos

markdown
Copiar
Editar

## 👥 Roles de usuario

- *Admin*: Puede gestionar habitaciones, ver y eliminar usuarios, ver reservas.
- *User*: Puede consultar habitaciones y hacer reservas.

## ✨ Funcionalidades

- Registro y login de usuarios.
- CRUD de habitaciones (admin).
- Visualización de habitaciones disponibles.
- Reservas de habitaciones por usuarios.
- Listado de usuarios y reservas (admin).
- Mensajes de error/success visuales.

## 🛠️ Configuración y ejecución

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tu_usuario/hotels.git
Configura tu base de datos (ej. MariaDB) y crea las tablas necesarias.

Ajusta la clase Database.java con tus credenciales:

java
Copiar
Editar
private static final String URL = "jdbc:mariadb://localhost:3306/hotels";
private static final String USER = "root";
private static final String PASSWORD = "tu_contraseña";
Despliega el proyecto en Apache Tomcat desde tu IDE o con Maven:

go
Copiar
Editar
mvn clean package
🖼️ Capturas de pantalla
(Puedes añadir aquí imágenes de la app: login, listado de habitaciones, etc.)

📄 Licencia
Este proyecto es de uso educativo y no está destinado a producción real. Libre uso para aprendizaje.