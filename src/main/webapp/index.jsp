<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>
<%@ include file="includes/search-room.jsp" %>


<h1>Esta es nuestra página de el hotel</h1>
<div class="container hstack gap-3">
<div class="login-container mb-3 ">
    <div class="login-box">
        <h1>Bienvenido a <span>MagicBinder</span></h1>
        <p>Inicia sesión para acceder a tu colección de cartas</p>

        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Usuario</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Entrar</button>
        </form>

        <p>¿No tienes cuenta? <a href="registerUser.jsp">Regístrate aquí</a></p>
    </div>
</div>


<%@ include file="includes/footer.jsp" %>
<%

Database database = new Database();
RoomDao roomDao = new RoomDao(database.getConnection());

List<Room> roomList = roomDao.getAll();


%>

<div>
    <%
    for (Room room : roomList) {
    %>
    <li>
        Habitación <strong><%= room.getRoomNumber() %></strong><br>
        Precio/noche: <%= room.getPriceNight() %> €<br>
        Disponible: <%= room.isAvailable() ? "Sí" : "No" %><br>
        Descripción: <%= room.getDescription() %>
    </li>
<%
        }
    %>
</div>
