package com.svalero.hotels.dao;

import com.svalero.hotels.model.Room;

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

            String sql = "SELECT * FROM HOTELS";

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
}