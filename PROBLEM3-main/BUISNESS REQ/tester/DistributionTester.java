package tester;

import dao.SterlingDAO;
import model.Distribution;
import util.ReadData;

public class DistributionTester {
    public static void readDistributionListInfo(SterlingDAO dao) {
        String date = ReadData.acceptString("Date Of Distribution (DD-MMM-YYYY): ");
        dao.saveDistribution(new Distribution(date));
    }
}
