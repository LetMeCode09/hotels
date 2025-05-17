<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Room</title>
</head>
<body>

<h2>Add New Room</h2>

<% if (request.getAttribute("successMessage") != null) { %>
<p style="color: green;"><%= request.getAttribute("successMessage") %></p>
<% } %>

<% if (request.getAttribute("errorMessage") != null) { %>
<p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>

<form method="post" action="add-room">
    <label>Room Number:</label><br>
    <input type="number" name="room_number" required><br><br>

    <label>Room Type:</label><br>
    <input type="text" name="type" required><br><br>

    <label>Price per Night:</label><br>
    <input type="number" name="price_night" required><br><br>

    <label>Available:</label><br>
    <select name="available">
        <option value="true">Yes</option>
        <option value="false">No</option>
    </select><br><br>

    <label>Description:</label><br>
    <textarea name="description" rows="4" cols="40"></textarea><br><br>

    <button type="submit">Añadir Habitación</button>
</form>

</body>
</html>