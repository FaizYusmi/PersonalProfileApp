package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        try {

            System.out.println("LOADING DRIVER");

            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("DRIVER LOADED");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/student_profiles?useSSL=false&serverTimezone=UTC",
                "root",
                "!Ahmad001125"
            );

            System.out.println("DATABASE CONNECTED");

            return con;

        } catch (Exception e) {

            System.out.println("DATABASE ERROR:");

            e.printStackTrace();

            return null;
        }
    }
}


