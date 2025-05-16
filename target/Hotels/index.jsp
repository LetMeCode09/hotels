<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>
<%@ include file="includes/search-room.jsp" %>


<h1>Esta es nuestra página de el hotel</h1>
<div class="login-container">
    <div class="login-box">
        <h1>Bienvenido a <span>MagicBinder</span></h1>
        <p>Inicia sesión para acceder a tu colección de cartas</p>

        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Usuario" required>
            <input type="password" name="password" placeholder="Contraseña" required>
            <button type="submit">Entrar</button>
        </form>

        <p>¿No tienes cuenta? <a href="registerUser.jsp">Regístrate aquí</a></p>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>
<%

Database database = new Database();
database.connect();

RoomDao roomDao = new RoomDao(database.getConnection());
%>

<div>
    <%
        List<Room> roomList;
    %>
</div>
