/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author CY
 */
public class DBUtil {

    private static Connection conn = null;

    public static Connection getConnection() {
        if (conn == null) 
        {
            try {
                String url = "jdbc:derby://localhost:1527/888Bags";

                String driver = "org.apache.derby.jdbc.ClientDriver";
                String username = "nbuser";
                String password = "nbuser";
                Class.forName(driver);
                conn = DriverManager.getConnection(url, username, password);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
}
