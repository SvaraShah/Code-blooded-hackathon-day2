package tester;

import dao.SterlingDAO;
import model.Invoice;
import util.ReadData;

public class InvoiceTester {
    public static void readInvoiceInfo(SterlingDAO dao) {
        String linkedCustomerId = ReadData.acceptString("Customer Id: ");
        int billingMonth = Integer.parseInt(ReadData.acceptString("Invoice Month: "));
        int billingYear = Integer.parseInt(ReadData.acceptString("Invoice Year: "));
        String invoiceDescription = ReadData.acceptString("Description: ");
        dao.saveInvoice(new Invoice(linkedCustomerId, billingMonth, billingYear, invoiceDescription));
    }
}
