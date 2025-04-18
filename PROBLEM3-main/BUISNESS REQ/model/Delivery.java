package model;

public class Delivery {
    private String employeeId;
    private String orderId;
    private String deliveryDate;
    private String status;
    private String remarks;

    public Delivery(String employeeId, String orderId, String deliveryDate, String status, String remarks) {
        this.employeeId = employeeId;
        this.orderId = orderId;
        this.deliveryDate = deliveryDate;
        this.status = status;
        this.remarks = remarks;
    }
}
