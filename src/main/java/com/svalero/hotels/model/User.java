package com.svalero.hotels.model;

import java.time.LocalDate;

public class User {
    private int idUser;
    private String firstName;
    private String lastName;
    private String dni;
    private String email;
    private String phone;
    private String password;
    private String role;

    public User() {}

    public User(int userId, String firstName, String lastName, String dni, String email, String phone, String password, String role) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dni = dni;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.role = role;
    }


}