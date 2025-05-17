<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="com.svalero.hotels.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page import="com.svalero.hotels.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>

<div class="container my-5">
  <h2 class="mb-4 text-center">User list</h2>

  <%
    Database database = new Database();
    UserDao userDao = new UserDao(database.getConnection());
    List<User> userList = userDao.getAll();

    if (user == null) {
      response.sendRedirect("index.jsp");
      return;
    }
  %>

  <div class="row">
    <%
      for (User userItem : userList) {
    %>
    <div class="col-md-4 mb-4">
      <div class="card h-100 shadow fondo-rosita rounded-4">
        <div class="card-body d-flex flex-column justify-content-between">
          <div>
            <h5 class="card-title texto-rosa fw-bold">User <%= userItem.getUsername() %></h5>
            <p class="card-text">
              <strong> Name:</strong> <%= userItem.getFirstName() %> <br>
              <strong> Available::</strong> <%= userItem.getLastName() %><br>
              <strong> DNI:</strong> <%= userItem.getDni() %> <br>
              <strong> email:</strong> <%= userItem.getEmail() %>
            </p>
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