package com.lms.librarymanagementsystem.Handlers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateHandler {
    public static String getCurrentDate() {
        LocalDate currentDate = LocalDate.now(); // get current date
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // create formatter for MySQL format
        String mysqlDate = currentDate.format(formatter); // format current date as MySQL string
        return mysqlDate;
    }
}
