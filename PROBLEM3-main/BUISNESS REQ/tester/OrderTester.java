package tester;

import dao.SterlingDAO;
import model.Order;
import util.ReadData;

public class OrderTester {
    public static void readOrderInfo(SterlingDAO dao) {
        String customerId = ReadData.acceptString("Customer Id: ");
        String orderDate = ReadData.acceptString("Date Of Order(DD-MMM-YYYY): ");
        String recipientName = ReadData.acceptString("Recipient Name: ");
        String recipientAddress = ReadData.acceptString("Recipient Address: ");
        String recipientCity = ReadData.acceptString("Recipient City (D, P, B, C): ");
        float weight = Float.parseFloat(ReadData.acceptString("Courier Weight: "));
        String description = ReadData.acceptString("Description: ");
        dao.saveOrder(new Order(customerId, orderDate, recipientName, recipientAddress, recipientCity, weight, description));
    }
}
