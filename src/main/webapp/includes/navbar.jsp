<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.svalero.hotels.model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand texto-rosa" href="index.jsp">VICE CITY HOTELS 🍸</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarContent" aria-controls="navbarContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="room-list.jsp">Rooms</a>
                </li>

                <% if (user == null) { %>
                <li class="nav-item">
                    <a class="nav-link" href="registerUser.jsp"> Sign up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Log in</a>
                </li>
                <% } else { %>
                <% if ("user".equals(user.getRole())) { %>
                <li class="nav-item">
                    <a class="nav-link" href="UserZoneServlet">My area</a>
                </li>
                <% } %>
                <li class="nav-item">
                    <span class="nav-link texto-rosa" >Hi, <%= user.getUsername() %></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Log out</a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>