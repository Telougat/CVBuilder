package com.cvbuilder;

import org.mindrot.jbcrypt.BCrypt;

public class Helpers {

    private static final int hashingComplexity = 12;

    public static String hashPassword(String plain) {
        return BCrypt.hashpw(plain, BCrypt.gensalt(Helpers.hashingComplexity));
    }

    public static boolean checkPassword(String plain, String hash) {
        return BCrypt.checkpw(plain, hash);
    }

}
