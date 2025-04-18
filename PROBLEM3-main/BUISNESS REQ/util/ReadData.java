package util;

import java.util.Scanner;

public class ReadData {
    private static final Scanner sc = new Scanner(System.in);

    public static String acceptString(String prompt) {
        System.out.print(prompt);
        return sc.nextLine();
    }
}
