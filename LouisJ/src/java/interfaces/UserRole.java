/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

/**
 *
 * @author CY
 */
public abstract class UserRole {
    public static final String CUSTOMER = "customer";
    public static final String STAFF = "staff";
    public static final String MANAGER = "manager";
    private String userRole;
    private String username;

    public String getUserRole() {
        return userRole;
    }

    public String getUsername() {
        return username;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
    
}
