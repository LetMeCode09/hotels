package com.svalero.hotels.servlet;

import com.svalero.hotels.dao.RoomDao;
import com.svalero.hotels.database.Database;
import com.svalero.hotels.model.Room;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/add-room")
public class AddRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomNumber = Integer.parseInt(request.getParameter("room_number"));
        String type = request.getParameter("type");
        int priceNight = Integer.parseInt(request.getParameter("price_night"));
        boolean available = Boolean.parseBoolean(request.getParameter("available"));
        String description = request.getParameter("description");

        Room room = new Room();
        room.setRoomNumber(roomNumber);
        room.setRoomType(type);
        room.setPriceNight(priceNight);
        room.setAvailable(available);
        room.setDescription(description);

        try {
            Database database = new Database();
            Connection connection = database.connect();
            RoomDao roomDao = new RoomDao(connection);
            roomDao.add(room);

            request.setAttribute("successMessage", "Room added successfully!");
            request.getRequestDispatcher("add-room.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("add-room.jsp").forward(request, response);
        }
    }
}