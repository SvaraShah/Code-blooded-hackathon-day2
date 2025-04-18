package model;

public class Customer {
    private String customerName;
    private String registrationDate;
    private String customerAddress;
    private String customerCity;
    private String postalCode;
    private String contactNumber;
    private String emailAddress;

    public Customer(String customerName, String registrationDate, String customerAddress, String customerCity, String postalCode, String contactNumber, String emailAddress) {
        this.customerName = customerName;
        this.registrationDate = registrationDate;
        this.customerAddress = customerAddress;
        this.customerCity = customerCity;
        this.postalCode = postalCode;
        this.contactNumber = contactNumber;
        this.emailAddress = emailAddress;
    }
}
