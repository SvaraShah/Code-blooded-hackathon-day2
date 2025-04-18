package model;

public class Customer {
    private String name;
    private String dateOfRegistration;
    private String address;
    private String city;
    private String pin;
    private String phone;
    private String email;

    public Customer(String name, String dateOfRegistration, String address, String city, String pin, String phone, String email) {
        this.name = name;
        this.dateOfRegistration = dateOfRegistration;
        this.address = address;
        this.city = city;
        this.pin = pin;
        this.phone = phone;
        this.email = email;
    }
}
