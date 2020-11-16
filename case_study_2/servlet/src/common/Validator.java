package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {
    public static Pattern pattern;
    public static Matcher matcher;
    public static final String DOB_CHECKING = "(\\d{1,2})[-](\\d{1,2})[-](\\d{4})";
    public static final String EMAIL_CHECKING = "^[\\w-.]+[\\w-.]*@([\\w-]+\\.)+[\\w-]{2,4}$";
    public static final String PHONE_NUMBER_CHECKING = "(090|091|\\(84\\)\\+90|\\(84\\)\\+91)\\d{7}";
    public static final String ID_CARD_CHECKING = "\\d{9}";

    public boolean isValidDateOfBirth(String date) {
        try {
            LocalDate birthDate = LocalDate.parse(date, DateTimeFormatter.ISO_LOCAL_DATE);
            return birthDate.plusYears(18).isBefore(LocalDate.now());
        }
        catch (Exception e) {
            return false;
        }
    }
    //        pattern = Pattern.compile(DOB_CHECKING);
//        matcher = pattern.matcher(date);
//        if (matcher.matches()) {
//            int dd = Integer.parseInt(matcher.group(3));
//            int mm = Integer.parseInt(matcher.group(2));
//            int yyyy = Integer.parseInt(matcher.group(1));
//            return dd >= 0 && dd <= 31 && mm >= 0 && mm <= 12 && yyyy >= 1900 && yyyy <= Year.now().getValue() - 18;
//        } else return false;

    public boolean isValidPhoneNumber(String phoneNumber) {
        pattern = Pattern.compile(PHONE_NUMBER_CHECKING);
        matcher = pattern.matcher(phoneNumber);
        if(matcher.matches()) {
            return matcher.matches();
        } else return false;
    }
    public boolean isValidIdCard(String idCard) {
        pattern = Pattern.compile(ID_CARD_CHECKING);
        matcher = pattern.matcher(idCard);
        if(matcher.matches()) {
            return matcher.matches();
        } else return false;
    }
    public boolean isValidEmail (String email) {
        pattern = Pattern.compile(EMAIL_CHECKING);
        matcher = pattern.matcher(email);
        if (matcher.matches()) {
            return matcher.matches();
        } else return false;
    }
}
