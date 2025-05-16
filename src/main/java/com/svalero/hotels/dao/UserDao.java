package com.svalero.hotels.dao;

import com.svalero.hotels.exception.UserNotFoundException;
import com.svalero.hotels.model.User;

import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    private final Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public boolean add(User user) throws SQLException {
        String sql = "INSERT INTO users (first_name, last_name, dni, email, phone, password, role)" +
                "VALUES (?, ?, ?, ?, ?, SHA1(?), ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getFirstName());
            statement.setString(3, user.getLastName());
            statement.setString(4, user.getDni());
            statement.setString(5, user.getEmail());
            statement.setString(6, user.getPhone());
            statement.setString(7, user.getPassword());
            statement.setString(8, user.getRole());

            int affectedRows = statement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet Keys = statement.getGeneratedKeys()) {
                    if (Keys.next()) {
                        user.setIdUser(Keys.getInt(1));
                    }
                }
            }
            return affectedRows > 0;
        }
    }

    public boolean exists(String username) throws SQLException {
        String sql = "SELECT 1 FROM users WHERE username = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next();
            }
        }
    }


}