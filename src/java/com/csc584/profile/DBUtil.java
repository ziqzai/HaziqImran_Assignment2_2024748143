package com.csc584.profile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String URL =
        "jdbc:mysql://localhost:3306/student_profiles?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";      // ikut phpMyAdmin
    private static final String PASSWORD = "";      // kalau phpMyAdmin tak ada password

    public static Connection getConnection() throws SQLException, ClassNotFoundException {

        // Cuba driver versi baru (MySQL Connector/J 8)
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // Kalau tak jumpa, cuba driver lama (MySQL Connector/J 5)
            Class.forName("com.mysql.jdbc.Driver");
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
