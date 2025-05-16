package com.svalero.hotels.dao;

import com.svalero.hotels.model.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDao {

    private final Connection connection;

    public BookingDao(Connection connection) {
        this.connection = connection;
    }

    public boolean add(Booking booking) throws SQLException {
        String sql = "INSERT INTO bookings (id_user, id_room, start_date, end_date) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, booking.getIdUser());
            statement.setInt(2, booking.getIdRoom());
            statement.setDate(3, Date.valueOf(booking.getStartDate()));
            statement.setDate(4, Date.valueOf(booking.getEndDate()));

            int affectedRows = statement.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet keys = statement.getGeneratedKeys()) {
                    if (keys.next()) {
                        booking.setIdBooking(keys.getInt(1));
                    }
                }
            }
            return affectedRows > 0;
        }
    }

    public Booking getById(int id) throws SQLException {
        String sql = "SELECT * FROM bookings WHERE id_booking = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                return rs.next() ? mapBooking(rs) : null;
            }
        }
    }

    public List<Booking> getAll() throws SQLException {
        String sql = "SELECT * FROM bookings";
        List<Booking> bookings = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                bookings.add(mapBooking(rs));
            }
        }
        return bookings;
    }

    public List<Booking> getByUserId(int userId) throws SQLException {
        String sql = "SELECT * FROM bookings WHERE id_user = ?";
        List<Booking> bookings = new ArrayList<>();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    bookings.add(mapBooking(rs));
                }
            }
        }
        return bookings;
    }

    public boolean update(Booking booking) throws SQLException {
        String sql = "UPDATE bookings SET id_user = ?, id_room = ?, start_date = ?, end_date = ? WHERE id_booking = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, booking.getIdUser());
            statement.setInt(2, booking.getIdRoom());
            statement.setDate(3, Date.valueOf(booking.getStartDate()));
            statement.setDate(4, Date.valueOf(booking.getEndDate()));
            statement.setInt(6, booking.getIdBooking());
            return statement.executeUpdate() > 0;
        }
    }

    public boolean delete(int bookingId) throws SQLException {
        String sql = "DELETE FROM bookings WHERE id_booking = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, bookingId);
            return statement.executeUpdate() > 0;
        }
    }

    private Booking mapBooking(ResultSet rs) throws SQLException {
        Booking booking = new Booking();
        booking.setIdBooking(rs.getInt("id_booking"));
        booking.setIdUser(rs.getInt("id_user"));
        booking.setIdRoom(rs.getInt("id_room"));
        booking.setStartDate(rs.getDate("start_date").toLocalDate());
        booking.setEndDate(rs.getDate("end_date").toLocalDate());
        return booking;
    }
}