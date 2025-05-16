package com.svalero.hotels.model;

import java.time.LocalDate;

public class Booking {
    private int idBooking;
    private int idRoom;
    private int idUser;
    private LocalDate startDate;
    private LocalDate endDate;

    public Booking (){}

    public Booking(int idRoom, int idUser, LocalDate startDate, LocalDate endDate) {
        this.idRoom = idRoom;
        this.idUser = idUser;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getIdBooking() {return idBooking;}

    public void setIdBooking(int idBooking) {this.idBooking = idBooking;}

    public int getIdRoom() {return idRoom;}

    public void setIdRoom(int idRoom) {this.idRoom = idRoom;}

    public int getIdUser() {return idUser;}

    public void setIdUser(int idUser) {this.idUser = idUser;}

    public LocalDate getStartDate() {return startDate;}

    public void setStartDate(LocalDate startDate) {this.startDate = startDate;}

    public LocalDate getEndDate() {return endDate;}

    public void setEndDate(LocalDate endDate) {this.endDate = endDate;}

}