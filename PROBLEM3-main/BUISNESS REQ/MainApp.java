import dao.SterlingDAO;
import tester.*;
import util.ReadData;

public class MainApp {
    public static void main(String[] args) {
        SterlingDAO dao = new SterlingDAO();

        while (true) {
            System.out.println("\n=======================================");
            System.out.println("        Sterling Courier Company       ");
            System.out.println("=======================================");
            System.out.println("1. Customer Registration");
            System.out.println("2. Courier Order Booking");
            System.out.println("3. Courier Dispatch Responsibility Generation");
            System.out.println("4. Courier Delivery");
            System.out.println("5. Invoice Generation");
            System.out.println("6. Exit");

            int choice = Integer.parseInt(ReadData.acceptString("Enter your choice: "));

            switch (choice) {
                case 1 -> CustomerTester.readCustomerInfo(dao);
                case 2 -> OrderTester.readOrderInfo(dao);
                case 3 -> DistributionTester.readDistributionListInfo(dao);
                case 4 -> DeliveryTester.readDeliveryInfo(dao);
                case 5 -> InvoiceTester.readInvoiceInfo(dao);
                case 6 -> {
                    System.out.println("Thank you! Exiting...");
                    return;
                }
                default -> System.out.println("Invalid choice. Try again.");
            }
        }
    }
}
