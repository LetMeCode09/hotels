package com.svalero.hotels.servlet;

import com.svalero.hotels.dao.UserDao;
import com.svalero.hotels.database.Database;
import com.svalero.hotels.exception.UserNotFoundException;
import com.svalero.hotels.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection connection = new Database().getConnection()) {
            UserDao userDao = new UserDao(connection);

            User user = userDao.login(username, password);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("admin-dashboard.jsp");
            } else {
                response.sendRedirect("user-zone.jsp");
            }

        } catch (UserNotFoundException e) {
            request.setAttribute("errorMessage", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("login-error.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error al conectar con la base de datos.");
            request.getRequestDispatcher("login-error.jsp").forward(request, response);
        }
    }
}
