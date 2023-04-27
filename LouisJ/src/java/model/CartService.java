/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TransactionRequiredException;

/**
 *
 * @author Asus
 */
public class CartService {
//    
//    @PersistenceContext
//    EntityManager mgr;
//
//    public CartService(EntityManager mgr) {
//        this.mgr = mgr;
//    }
//
//    public boolean addCart(Cart cart) {
//        try {
//            mgr.persist(cart);
//        } catch (EntityExistsException ex) {
//            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, "Error in adding entity, duplicated entity found", ex);
//            return false;
//        } catch (IllegalArgumentException | TransactionRequiredException ex) {
//            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, null, ex);
//            return false;
//        }
//        return true;
//    }
//
//    public Cart findCartByCartid(int cartid) {
//        Cart cart = mgr.find(Cart.class, cartid);
//        return cart;
//    }
//
//    public Cart findCartBy(String username) {
//        try {
//            return (Customer) mgr.createNamedQuery("Customer.findByUsername").setParameter("username", username).getSingleResult();
//        } catch (EntityExistsException ex) {
//            Logger.getLogger(CustomerService.class.getName()).log(Level.SEVERE, "No record found!", ex);
//        } catch (Exception ex) {
//            Logger.getLogger(CustomerService.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
//
//    public boolean deletecustomer(String id) {
//        Customer customer = findCustomerById(id);
//        if (customer != null) {
//            mgr.remove(customer);
//            return true;
//        }
//        return false;
//    }
//
//    public List<Customer> findAll() {
//        List customerList = mgr.createNamedQuery("Customer.findAll").getResultList();
//        return customerList;
//    }
//
//    public boolean updateItem(Customer customer) {
//        Customer tempCustomer = findCustomerById(customer.getId());
//        if (tempCustomer != null) {
//            tempCustomer.setUsername(customer.getUsername());
//            return true;
//        }
//        return false;
//    }
}
