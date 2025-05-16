package com.svalero.hotels.dao;

import com.svalero.hotels.exception.UserNotFoundException;
import com.svalero.hotels.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private final Connection connection;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public boolean add(User user) throws SQLException {
        String sql = "INSERT INTO users (username, first_name, last_name, dni, email, phone, password, role) " +
                "VALUES (?, ?, ?, ?, ?, ?, SHA1(?), ?)";
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
                try (ResultSet keys = statement.getGeneratedKeys()) {
                    if (keys.next()) {
                        user.setIdUser(keys.getInt(1));
                    }
                }
            }
            return affectedRows > 0;
        }
    }

    public User login(String username, String password) throws SQLException, UserNotFoundException {
        String sql = "SELECT * FROM users WHERE username = ? AND password = SHA1(?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            try (ResultSet rs = statement.executeQuery()) {
                if (!rs.next()) throw new UserNotFoundException();
                return mapUser(rs);
            }
        }
    }

    public User getById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE id_user = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? mapUser(rs) : null;
            }
        }
    }

    public User getByUsername(String username) throws SQLException {
        String sql = "SELECT * FROM users WHERE username = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            try (ResultSet rs = statement.executeQuery()) {
                if (!rs.next()) {
                    throw new SQLException("No se encontró el usuario con nombre: " + username);
                }
                return mapUser(rs);
            }
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

    public List<User> getAll() throws SQLException {
        String sql = "SELECT * FROM users";
        List<User> users = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                users.add(mapUser(rs));
            }
        }
        return users;
    }

    public List<User> search(String keyword) throws SQLException {
        String sql = "SELECT * FROM users WHERE username LIKE ? OR email LIKE ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            String wildcard = "%" + keyword + "%";
            statement.setString(1, wildcard);
            statement.setString(2, wildcard);
            List<User> users = new ArrayList<>();
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    users.add(mapUser(rs));
                }
            }
            return users;
        }
    }

    public boolean update(User user) throws SQLException {
        String sql = "UPDATE users SET username = ?, first_name = ?, last_name = ?, dni = ?, email = ?, phone = ?, password = SHA1(?), role = ? WHERE id_user = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getFirstName());
            statement.setString(3, user.getLastName());
            statement.setString(4, user.getDni());
            statement.setString(5, user.getEmail());
            statement.setString(6, user.getPhone());
            statement.setString(7, user.getPassword());
            statement.setString(8, user.getRole());
            statement.setInt(9, user.getIdUser());

            return statement.executeUpdate() > 0;
        }
    }

    public boolean delete(int userId) throws SQLException {
        String sql = "DELETE FROM users WHERE id_user = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            return statement.executeUpdate() > 0;
        }
    }

    private User mapUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setIdUser(rs.getInt("id_user"));
        user.setUsername(rs.getString("username"));
        user.setFirstName(rs.getString("first_name"));
        user.setLastName(rs.getString("last_name"));
        user.setDni(rs.getString("dni"));
        user.setEmail(rs.getString("email"));
        user.setPhone(rs.getString("phone"));
        user.setPassword(rs.getString("password"));
        user.setRole(rs.getString("role"));
        return user;
    }
}