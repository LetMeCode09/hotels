package com.svalero.hotels.dao;

import com.svalero.hotels.exception.RoomNotFoundException;
import com.svalero.hotels.model.Room;
import com.svalero.hotels.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomDao {

    private Connection connection;

    public RoomDao(Connection connection) {
        this.connection = connection;
    }

    public List<Room> getAll() throws SQLException {

            String sql = "SELECT * FROM rooms";

            PreparedStatement statement = statement = connection.prepareStatement(sql);

            ResultSet result = statement.executeQuery();

            ArrayList<Room> roomList = new ArrayList<>();

            while (result.next()) {

                Room room = new Room();
                room.setIdRoom(result.getInt("id_room"));
                room.setRoomNumber(result.getInt("room_number"));
                room.setRoomType(result.getString("type"));
                room.setPriceNight(result.getInt("price_night"));
                room.setAvailable(result.getBoolean("available"));
                room.setDescription(result.getString("description"));

                roomList.add(room);
            }
            result.close();
            statement.close();
            return roomList;
    }

    public Room getById(int id) throws SQLException, RoomNotFoundException {

        String sql = "SELECT * FROM ROOMS WHERE id_room = ?";
        PreparedStatement statement = null;
        ResultSet result = null;
        statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        result = statement.executeQuery();

        if (!result.next()) {
            throw new RoomNotFoundException();
        }

        Room room = new Room();
        room.setIdRoom(result.getInt("id_room"));
        room.setRoomNumber(result.getInt("room_number"));
        room.setRoomType(result.getString("type"));
        room.setPriceNight(result.getInt("price_night"));
        room.setAvailable(result.getBoolean("available"));
        room.setDescription(result.getString("description"));

        statement.close();

        return (room);
    }

    public boolean add(Room room) throws SQLException {
        String sql = "INSERT INTO ROOMS (room_number, type, price_night, description, available) VALUES (?,?,?,?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setInt(1, room.getRoomNumber());
        statement.setString(2, room.getType());
        statement.setDouble(3, room.getPriceNight());
        statement.setString(4, room.getDescription());
        statement.setBoolean(5, room.isAvailable());

        //UPDATE, INSERT, DELETE SE EJEVUTAN CON ESTE
        int affectedRows = statement.executeUpdate();
        //execute.query PARA LAS CONSULTAS SELECT

        //DEVUELVO BOOLEANO PARA SABER SI AFECTA A LAS ROWS O NO
        return affectedRows != 0;
    }

    public boolean deleteRoomById(int id) throws SQLException {

        String sql = "DELETE FROM ROOMS WHERE id_room = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);

        int affectedRows = statement.executeUpdate();
        //SI HAY INEAS AFECTADAS, DE VOLVERA TRUE PORQUE ES DISTINDO QUE 0.
        return affectedRows != 0;
    }
}