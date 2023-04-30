/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package interfaces;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author CY
 */
public abstract class User {
    public static final String CUSTOMER = "customer";
    public static final String STAFF = "staff";
    public static final String MANAGER = "manager";
    private String usertype;
    private String username;
    private String id;
    private String passwordhash;
    private String email;
    private Serializable profileimg;
    private String fullname;
    private String contact;
    private String address;
    private Date datejoin;

    public String getUsertype() {
        return usertype;
    }

    public String getUsername() {
        return username;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId() {
        return id;
    }

    public void setId(String userId) {
        this.id = userId;
    }

    public String getPasswordhash() {
        return passwordhash;
    }

    public void setPasswordhash(String passwordhash) {
        this.passwordhash = passwordhash;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Serializable getProfileimg() {
        return profileimg;
    }

    public void setProfileimg(Serializable profileimg) {
        this.profileimg = profileimg;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDatejoin() {
        return datejoin;
    }

    public void setDatejoin(Date datejoin) {
        this.datejoin = datejoin;
    }
    
}
