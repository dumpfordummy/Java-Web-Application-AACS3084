/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import utils.DBUtil;
import java.sql.Connection;

/**
 *
 * @author CY
 */
public class CustomerDao {
    private Connection conn;
    
    public CustomerDao() {
        conn = DBUtil.getConnection();
    }
    
    
}
