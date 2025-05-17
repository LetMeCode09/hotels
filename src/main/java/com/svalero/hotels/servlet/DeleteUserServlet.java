package com.svalero.hotels.servlet;

import com.svalero.hotels.dao.RoomDao;
import com.svalero.hotels.database.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idAlbum = request.getParameter("id_album");
        int id = Integer.parseInt(idAlbum);

        try {
            Database database = new Database();
            database.connect();
            RoomDao roomDao = new RoomDao(database.getConnection());
            roomDao.deleteRoomById(id);

            response.sendRedirect("room-list.jsp");

        } catch (ClassNotFoundException | SQLException e) {

        }
    }
}
