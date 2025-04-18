package model;

public class Delivery {
    private String assignedEmployeeId;
    private String relatedOrderId;
    private String dateOfDelivery;
    private String deliveryStatus;
    private String deliveryRemarks;

    public Delivery(String assignedEmployeeId, String relatedOrderId, String dateOfDelivery, String deliveryStatus, String deliveryRemarks) {
        this.assignedEmployeeId = assignedEmployeeId;
        this.relatedOrderId = relatedOrderId;
        this.dateOfDelivery = dateOfDelivery;
        this.deliveryStatus = deliveryStatus;
        this.deliveryRemarks = deliveryRemarks;
    }
}
