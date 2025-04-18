package model;

public class Invoice {
    private String customerId;
    private int invoiceMonth;
    private int invoiceYear;
    private String description;

    public Invoice(String customerId, int invoiceMonth, int invoiceYear, String description) {
        this.customerId = customerId;
        this.invoiceMonth = invoiceMonth;
        this.invoiceYear = invoiceYear;
        this.description = description;
    }
}
