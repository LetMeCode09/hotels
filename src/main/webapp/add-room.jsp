<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>


<% if (request.getAttribute("successMessage") != null) { %>
<p style="color: green;"><%= request.getAttribute("successMessage") %></p>
<% } %>

<% if (request.getAttribute("errorMessage") != null) { %>
<p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
<% } %>

<div class="bg-dark bg-opacity-75 text-white p-4 rounded">
  <h2 class="mb-4 text-center">Add New Room</h2>

<form method="post" action="add-room" class="container my-5">
  <div class="mb-3">
    <label for="roomNumber" class="form-label">Room Number:</label>
    <input type="number" name="room_number" class="form-control" id="roomNumber" required>
  </div>

  <div class="mb-3">
    <label for="roomType" class="form-label">Room Type:</label>
    <input type="text" name="type" class="form-control" id="roomType" required>
  </div>

  <div class="mb-3">
    <label for="priceNight" class="form-label">Price per Night:</label>
    <input type="number" name="price_night" class="form-control" id="priceNight" required>
  </div>

  <div class="mb-3">
    <label for="available" class="form-label">Available:</label>
    <select name="available" class="form-select" id="available">
      <option value="true">Yes</option>
      <option value="false">No</option>
    </select>
  </div>

  <div class="mb-3">
    <label for="description" class="form-label">Description:</label>
    <textarea name="description" rows="4" class="form-control" id="description"></textarea>
  </div>

  <button type="submit" class="btn btn-rosa">Add room</button>
</form>
</div>


<%@ include file="includes/footer.jsp" %>