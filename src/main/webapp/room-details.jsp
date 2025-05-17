<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.User" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="java.util.List" %>
<body class="bg-custom-client-zone">
<div class="col">
    <h1>Rooms</h1>
    <%
        Database database = new Database();
        RoomDao roomDao = new RoomDao(database.getConnection());

        int idRoom = Integer.parseInt(request.getParameter("id_room"));

        Room room = roomDao.getById(idRoom);

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    %>

    <div class="container-centered">
        <div class="card" style="width: 30rem;">
            <div class="card-body">
                <h5 class="card-title"><%=room.getPriceNight()%>
                </h5>
                <p class="card-text"><%=room.getDescription()%>
                </p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Available: <%=room.getAvailable() ? "si" : "no"%>
                </li>
                <li class="list-group-item">type: <%=room.getType()%>
                </li>
            </ul>
            <div class="card-body">
                <a href="DeleteRoomServlet?idRoom==<%=idRoom%>"
                   class="card-link"
                   onclick="return confirm('¿Estás seguro de que deseas eliminar este álbum? Esta acción no se puede deshacer.');">
                    Eliminar
                </a>
            </div>
        </div>
    </div>
</div>
</body>