package tester;

import dao.SterlingDAO;
import model.Delivery;
import util.ReadData;

public class DeliveryTester {
    public static void readDeliveryInfo(SterlingDAO dao) {
        String assignedEmployeeId = ReadData.acceptString("Employee Id: ");
        System.out.println("Assigned Courier’s : 2001, 2002, 2003");
        String relatedOrderId = ReadData.acceptString("Order Id: ");
        String dateOfDelivery = ReadData.acceptString("Date Of Delivery(DD-MMM-YYYY): ");
        String deliveryStatus = ReadData.acceptString("Status (P, R, D): ");
        String deliveryRemarks = ReadData.acceptString("Remarks: ");
        
        dao.saveDelivery(new Delivery(assignedEmployeeId, relatedOrderId, dateOfDelivery, deliveryStatus, deliveryRemarks));
    }
}
