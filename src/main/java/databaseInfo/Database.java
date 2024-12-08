package databaseInfo;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class Database {

    private static String URL;
    private static String USERNAME;
    private static String PASSWORD;

    static {
        try (InputStream input = Database.class.getClassLoader().getResourceAsStream("dbconfig.properties")) {
            if (input == null) {
                throw new RuntimeException("dbconfig.properties file not found in resources");
            }
            Properties props = new Properties();
            props.load(input);

            // Load database credentials from the properties file
            URL = props.getProperty("db.url");
            USERNAME = props.getProperty("db.username");
            PASSWORD = props.getProperty("db.password");

            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

        } catch (Exception e) {
            System.err.println("Failed to load database configuration or driver!");
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize databaseInfo.Database class", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        // Return the connection
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}
