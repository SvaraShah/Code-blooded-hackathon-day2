package tester;

import dao.SterlingDAO;
import model.Customer;
import util.ReadData;

public class CustomerTester {
    public static void readCustomerInfo(SterlingDAO dao) {
        String customerName = ReadData.acceptString("Customer Name: ");
        String registrationDate = ReadData.acceptString("Date Of Registration(DD-MMM-YYYY): ");
        String customerAddress = ReadData.acceptString("Address: ");
        String customerCity = ReadData.acceptString("City: ");
        String postalCode = ReadData.acceptString("Pin: ");
        String contactNumber = ReadData.acceptString("Telephone Number: ");
        String emailAddress = ReadData.acceptString("E-mail Id: ");
        
        dao.saveCustomer(new Customer(customerName, registrationDate, customerAddress, customerCity, postalCode, contactNumber, emailAddress));
    }
}
