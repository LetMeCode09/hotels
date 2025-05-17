<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>

<div class="container my-5">
    <h2 class="mb-4 text-center">Listado de Habitaciones</h2>

    <%
        Database database = new Database();
        RoomDao roomDao = new RoomDao(database.getConnection());
        List<Room> roomList = roomDao.getAll();
    %>

    <div class="row">
        <%
            for (Room room : roomList) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Habitación <%= room.getRoomNumber() %></h5>
                    <p class="card-text">
                        <strong>Precio/noche:</strong> <%= room.getPriceNight() %> €<br>
                        <strong>Disponible:</strong> <%= room.isAvailable() ? "Sí" : "No" %><br>
                        <strong>Descripción:</strong> <%= room.getDescription() %>
                    </p>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>