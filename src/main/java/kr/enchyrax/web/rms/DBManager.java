package kr.enchyrax.web.rms;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {

    private static final String URL = "jdbc:mysql://localhost:3306/rms";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "1234";


    private static Connection connection;

    private DBManager() {}

    public static Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception exception) {
            exception.printStackTrace();
        }

        return connection;
    }
}
