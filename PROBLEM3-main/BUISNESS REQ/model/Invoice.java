package model;

public class Invoice {
    private String linkedCustomerId;
    private int billingMonth;
    private int billingYear;
    private String invoiceDescription;

    public Invoice(String linkedCustomerId, int billingMonth, int billingYear, String invoiceDescription) {
        this.linkedCustomerId = linkedCustomerId;
        this.billingMonth = billingMonth;
        this.billingYear = billingYear;
        this.invoiceDescription = invoiceDescription;
    }
}
