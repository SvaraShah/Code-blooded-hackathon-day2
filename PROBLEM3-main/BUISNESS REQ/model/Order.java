package model;

public class Order {
    private String customerId;
    private String orderDate;
    private String recipientName;
    private String recipientAddress;
    private String recipientCity;
    private float weight;
    private String description;

    public Order(String customerId, String orderDate, String recipientName, String recipientAddress, String recipientCity, float weight, String description) {
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.recipientName = recipientName;
        this.recipientAddress = recipientAddress;
        this.recipientCity = recipientCity;
        this.weight = weight;
        this.description = description;
    }
}
