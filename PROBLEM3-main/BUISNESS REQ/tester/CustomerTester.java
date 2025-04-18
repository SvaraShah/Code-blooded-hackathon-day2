package tester;

import dao.SterlingDAO;
import model.Customer;
import util.ReadData;

public class CustomerTester {
    public static void readCustomerInfo(SterlingDAO dao) {
        String name = ReadData.acceptString("Customer Name: ");
        String regDate = ReadData.acceptString("Date Of Registration(DD-MMM-YYYY): ");
        String address = ReadData.acceptString("Address: ");
        String city = ReadData.acceptString("City: ");
        String pin = ReadData.acceptString("Pin: ");
        String phone = ReadData.acceptString("Telephone Number: ");
        String email = ReadData.acceptString("E-mail Id: ");
        dao.saveCustomer(new Customer(name, regDate, address, city, pin, phone, email));
    }
}
