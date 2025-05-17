<%@ page import="com.svalero.hotels.database.Database" %>
<%@ page import="com.svalero.hotels.model.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.hotels.dao.RoomDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>


<div class="container my-5">
    <h1 class="mb-4 text-center">Welcome to <span class="texto-rosa">VICE CITY HOTELS 🍸</span></h1>
    <p class="text-center">Log in to access your room:</p>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm fondo-rosita">
                <div class="card-body">
                    <form action="LoginServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">User</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-rosa w-100">Submit</button>
                    </form>
                    <div class="mt-3 text-center">
                        <p>Don't have an account? <a href="registerUser.jsp">Register here</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>

