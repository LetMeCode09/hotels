<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>
<%@ include file="includes/search-room.jsp" %>

<div class="container my-5">
    <h1 class="mb-4 text-center">Bienvenido a <span class="text-primary">VICE CITY HOTELS 🍸</span></h1>
    <p class="text-center">Inicia sesión para acceder a tu habitación:</p>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm fondo-transparente shadow-sm">
                <div class="card-body">
                    <form action="LoginServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Usuario</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Contraseña</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Entrar</button>
                    </form>
                    <div class="mt-3 text-center">
                        <p>¿No tienes cuenta? <a href="registerUser.jsp">Regístrate aquí</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

