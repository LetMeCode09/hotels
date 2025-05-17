<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="com.svalero.hotels.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>

<div class="container my-5">
    <h2 class="mb-4 text-center">Room list</h2>

    <%
        Database database = new Database();
        RoomDao roomDao = new RoomDao(database.getConnection());
        List<Room> roomList = roomDao.getAll();

        if (user == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>

    <div class="row">
        <%
            for (Room room : roomList) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow fondo-rosita rounded-4">
                <div class="card-body d-flex flex-column justify-content-between">
                    <div>
                        <h5 class="card-title texto-rosa fw-bold">Room <%= room.getRoomNumber() %></h5>
                        <p class="card-text">
                            <strong>💰 Price/night:</strong> <%= room.getPriceNight() %> €<br>
                            <strong>📶 Available::</strong> <%= room.isAvailable() ? "Sí" : "No" %><br>
                            <strong>📝 Description:</strong> <%= room.getDescription() %>
                        </p>
                    </div>

                    <div class="d-flex flex-wrap gap-2 mt-3">
                        <a href="CardDetailsServlet?id=<%= room.getIdRoom() %>" class="btn btn-rosa">View details</a>

                        <% if ("admin".equals(user.getRole())) { %>
                        <a href="EditRoomServlet?idRoom=<%= room.getIdRoom() %>" class="btn btn-warning">Edit</a>
                        <a href="DeleteRoomServlet?idRoom=<%= room.getIdRoom() %>"
                           class="btn btn-danger"
                           onclick="return confirm('¿Seguro que deseas eliminar esta habitación?');">Delete</a>
                        <% } else if ("user".equals(user.getRole())) { %>
                        <form action="AddToUserServlet" method="post" class="d-inline">
                            <input type="hidden" name="cardId" value="<%= room.getIdRoom() %>">
                            <button type="submit" class="btn btn-rosa">Book</button>
                        </form>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <%
            }
        %>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>