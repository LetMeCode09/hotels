package com.svalero.hotels.model;

import java.time.LocalDate;

public class Room {
    private int idRoom;
    private int roomNumber;
    private String Type;
    private double priceNight;
    private boolean available;
    private String description;

    public Room() {}

    public Room(int roomNumber, String roomType, double priceNight, boolean available, String description) {
        this.roomNumber = roomNumber;
        this.Type = roomType;
        this.priceNight = priceNight;
        this.available = available;
        this.description = description;
    }

    public int getIdRoom() {return idRoom;}

    public void setIdRoom(int idRoom) {this.idRoom = idRoom;}

    public void setRoomNumber(int roomNumber) {this.roomNumber = roomNumber;}

    public void setRoomType(String roomType) {this.Type = roomType;}

    public double getPriceNight() {return priceNight;}

    public String getType() {return Type;}

    public boolean getAvailable() {return available;}

    public double getRoomNumber() {return roomNumber;}

    public void setPriceNight(double priceNight) {this.priceNight = priceNight;}

    public boolean isAvailable() {return available;}

    public void setAvailable(boolean available) {this.available = available;}

    public String getDescription() {return description;}

    public void setDescription(String description) {this.description = description;}

}