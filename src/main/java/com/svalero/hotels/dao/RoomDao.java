public class RoomDao {


    private Connection connection;

    public RoomDao(Connection connection) {

        this.connection = connection;
    }

    public getAll() {
        String sql = "SELECT * FROM HOTELS";

        PreparedStatement statement = null;
        ResultSet result = null;
        statement = connection.prepareStatement(sql);

        ResultSet result = statement.executeQuery();
        ArrayList<Room> roomList = new ArrayList<>();

        while (result.next()) {
            Room room = new Room();
            room.setIdRoom(result.getInt("id_room"));
            room.setRoomNumber(result.getInt("room_number"));
            room.setIdRoomType(result.getInt("room_type"));
            room.setPriceNight(result.getInt("price_night"));
            room.setAvailable(result.getInt("avaible"));
            room.setDescription(result.getInt("description"));

        }

        result.close();
        statement.close();
        return Room;
    }