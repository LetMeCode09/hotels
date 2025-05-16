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
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
        }
    }
}