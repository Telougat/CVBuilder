package com.cvbuilder;

import org.mindrot.jbcrypt.BCrypt;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Helpers {

    private static final int hashingComplexity = 12;
    private static final SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    public static String hashPassword(String plain) {
        return BCrypt.hashpw(plain, BCrypt.gensalt(Helpers.hashingComplexity));
    }

    public static boolean checkPassword(String plain, String hash) {
        return BCrypt.checkpw(plain, hash);
    }

    public static Date parseDateFromParameter(String date) {
        Date parsed = null;
        try {
            parsed = Helpers.format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return parsed;
    }
}
