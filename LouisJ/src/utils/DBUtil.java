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
                String url = "jdbc:sqlserver://dumpfordummy.database.windows.net:1433;database=LouisJ;user=LouisJ@dumpfordummy;password=Louis@2023;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

                DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
                conn = DriverManager.getConnection(url);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }
}
