package dao;

import model.*;

public class SterlingDAO {
    public int saveCustomer(Customer newCustomer) {
        System.out.println("Customer is saved.");
        return 0;
    }

    public int saveOrder(Order newOrder) {
        System.out.println("Order is saved.");
        return 0;
    }

    public int saveDistribution(Distribution newDistribution) {
        System.out.println("Distribution is saved.");
        return 0;
    }

    public int saveDelivery(Delivery newDelivery) {
        System.out.println("Delivery is saved.");
        return 0;
    }

    public int saveInvoice(Invoice newInvoice) {
        System.out.println("Invoice is saved.");
        return 0;
    }
}
