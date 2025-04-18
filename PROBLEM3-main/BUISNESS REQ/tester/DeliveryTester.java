package tester;

import dao.SterlingDAO;
import model.Delivery;
import util.ReadData;

public class DeliveryTester {
    public static void readDeliveryInfo(SterlingDAO dao) {
        String empId = ReadData.acceptString("Employee Id: ");
        System.out.println("Assigned Courier’s : 2001, 2002, 2003");
        String orderId = ReadData.acceptString("Order Id: ");
        String deliveryDate = ReadData.acceptString("Date Of Delivery(DD-MMM-YYYY): ");
        String status = ReadData.acceptString("Status (P, R, D): ");
        String remarks = ReadData.acceptString("Remarks: ");
        dao.saveDelivery(new Delivery(empId, orderId, deliveryDate, status, remarks));
    }
}
