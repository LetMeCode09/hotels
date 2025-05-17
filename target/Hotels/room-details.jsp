<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.User" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="java.util.List" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>

    <%
        Database database = new Database();
        RoomDao roomDao = new RoomDao(database.getConnection());

        int idRoom = Integer.parseInt(request.getParameter("idRoom"));

        Room room = roomDao.getById(idRoom);

        if (user == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>

    <h1  class="mb-4 text-center" >Rooms</h1>

    <div class="container my-5 d-flex justify-content-center">

        <div class="card fondo-rosita shadow-sm" style="width: 30rem;">

            <div class="card-body">
                <h5 class="card-title texto-rosa">Room number: <%= room.getRoomNumber()%></h5>
                <p class="card-text"> Price: <%= room.getPriceNight() %> €</p>
                <p class="card-text"><%= room.getDescription() %></p>
            </div>

            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    Available: <%= room.getAvailable() ? "yes" : "no" %>
                </li>
                <li class="list-group-item">
                    Type: <%= room.getType() %>
                </li>
            </ul>

            <div class="card-body text-center">
                <a href="DeleteRoomServlet?idRoom=<%=idRoom%>"
                   class="btn btn-outline-danger"
                   onclick="return confirm('¿Estás seguro de que deseas eliminar este álbum? Esta acción no se puede deshacer.');">
                    Delete
                </a>
            </div>

        </div>
    </div>

<%@ include file="includes/footer.jsp" %>



