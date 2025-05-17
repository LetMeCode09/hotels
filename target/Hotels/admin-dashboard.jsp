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
    <h2 class="text-center texto-lila mb-5">Administrator Panel</h2>

    <div class="row g-4 justify-content-center">

        <div class="col-md-4">
            <div class="card fondo-rosita shadow-sm text-center p-3 h-100">
                <h5 class="texto-rosa">Room Management</h5>
                <p>View, edit, and delete the available hotel rooms.</p>
                <a href="room-list.jsp" class="btn btn-rosa">View Rooms</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card fondo-rosita shadow-sm text-center p-3">
                <h5 class="texto-rosa">User Management </h5>
                <p>Manage accounts, roles, and data of registered users.</p>
                <a href="admin-usuarios.jsp" class="btn btn-rosa">View Users</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>