package com.svalero.hotels.exception;

public class BookingNotFoundException extends Exception {
    public BookingNotFoundException(String message) {
        super(message);
    }
}