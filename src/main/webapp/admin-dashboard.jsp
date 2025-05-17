<%@ page import="com.svalero.hotels.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>

<%
    if (user == null || !"admin".equals(user.getRole())) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<div class="container my-5">
    <h2 class="text-center texto-lila mb-5">Panel de Administrador</h2>

    <div class="row g-4 justify-content-center">

        <div class="col-md-4">
            <div class="card fondo-rosita shadow-sm text-center p-3">
                <h5 class="texto-rosa">Gestión de Habitaciones</h5>
                <p>Ver, editar y eliminar habitaciones disponibles en el hotel.</p>
                <a href="room-list.jsp" class="btn btn-lila">Ver Habitaciones</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card fondo-rosita shadow-sm text-center p-3">
                <h5 class="texto-rosa">Gestión de Reservas </h5>
                <p>Consulta todas las reservas realizadas por los usuarios.</p>
                <a href="admin-reservas.jsp" class="btn btn-lila">Ver Reservas</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card fondo-rosita shadow-sm text-center p-3">
                <h5 class="texto-rosa">Gestión de Usuarios </h5>
                <p>Administra cuentas, roles y datos de los usuarios registrados.</p>
                <a href="admin-usuarios.jsp" class="btn btn-lila">Ver Usuarios</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>