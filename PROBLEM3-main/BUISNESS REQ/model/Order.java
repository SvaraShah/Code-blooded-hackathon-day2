package model;

public class Order {
    private String linkedCustomerId;
    private String dateOfOrder;
    private String receiverName;
    private String receiverAddress;
    private String receiverCity;
    private float packageWeight;
    private String orderDescription;

    public Order(String linkedCustomerId, String dateOfOrder, String receiverName, String receiverAddress, String receiverCity, float packageWeight, String orderDescription) {
        this.linkedCustomerId = linkedCustomerId;
        this.dateOfOrder = dateOfOrder;
        this.receiverName = receiverName;
        this.receiverAddress = receiverAddress;
        this.receiverCity = receiverCity;
        this.packageWeight = packageWeight;
        this.orderDescription = orderDescription;
    }
}
