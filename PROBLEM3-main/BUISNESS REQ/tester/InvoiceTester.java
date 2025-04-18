package tester;

import dao.SterlingDAO;
import model.Invoice;
import util.ReadData;

public class InvoiceTester {
    public static void readInvoiceInfo(SterlingDAO dao) {
        String customerId = ReadData.acceptString("Customer Id: ");
        int month = Integer.parseInt(ReadData.acceptString("Invoice Month: "));
        int year = Integer.parseInt(ReadData.acceptString("Invoice Year: "));
        String desc = ReadData.acceptString("Description: ");
        dao.saveInvoice(new Invoice(customerId, month, year, desc));
    }
}
