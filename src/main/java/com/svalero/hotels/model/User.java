package com.svalero.hotels.model;

import java.time.LocalDate;

public class User {
    private int idUser;
    private String username;
    private String firstName;
    private String lastName;
    private String dni;
    private String email;
    private String phone;
    private String password;
    private String role;

    public User() {}

    public User(int idUser, String username, String firstName, String lastName, String dni, String email, String phone, String password, String role) {
        this.idUser = idUser;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dni = dni;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.role = role;
    }

    public int getIdUser() {return idUser;}

    public void setIdUser(int idUser) {this.idUser = idUser;}

    public String getUsername() {return username;}

    public void setUsername(String username) {this.username = username;}

    public String getFirstName() {return firstName;}

    public void setFirstName(String firstName) {this.firstName = firstName;}

    public String getLastName() {return lastName;}

    public void setLastName(String lastName) {this.lastName = lastName;}

    public String getDni() {return dni;}

    public void setDni(String dni) {this.dni = dni;}

    public String getEmail() {return email;}

    public void setEmail(String email) {this.email = email;}

    public String getPhone() {return phone;}

    public void setPhone(String phone) {this.phone = phone;}

    public String getPassword() {return password;}

    public void setPassword(String password) {this.password = password;}

    public String getRole() {return role;}

    public void setRole(String role) {this.role = role;}

}