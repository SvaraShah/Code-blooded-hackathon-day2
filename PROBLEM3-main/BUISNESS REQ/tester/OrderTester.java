package tester;

import dao.SterlingDAO;
import model.Order;
import util.ReadData;

public class OrderTester {
    public static void readOrderInfo(SterlingDAO dao) {
        String linkedCustomerId = ReadData.acceptString("Customer Id: ");
        String dateOfOrder = ReadData.acceptString("Date Of Order(DD-MMM-YYYY): ");
        String receiverName = ReadData.acceptString("Recipient Name: ");
        String receiverAddress = ReadData.acceptString("Recipient Address: ");
        String receiverCity = ReadData.acceptString("Recipient City (D, P, B, C): ");
        float packageWeight = Float.parseFloat(ReadData.acceptString("Courier Weight: "));
        String orderDescription = ReadData.acceptString("Description: ");
        dao.saveOrder(new Order(linkedCustomerId, dateOfOrder, receiverName, receiverAddress, receiverCity, packageWeight, orderDescription));
    }
}
