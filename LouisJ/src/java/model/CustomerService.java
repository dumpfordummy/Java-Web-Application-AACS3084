/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.*;

/**
 *
 * @author CY
 */
public class CustomerService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CustomerService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addCustomer(Customer customer) {
        try {
            mgr.persist(customer);
        } catch (EntityExistsException ex) {
            Logger.getLogger(CustomerService.class.getName()).log(Level.SEVERE, "Error in adding entity, duplicated entity found", ex);
            return false;
        } catch (IllegalArgumentException | TransactionRequiredException ex) {
            Logger.getLogger(CustomerService.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    public Customer findCustomerById(String id) {
        Customer customer = mgr.find(Customer.class, id);
        return customer;
    }
    
    public Customer findCustomerByUsername(String username) {
         try {
            return (Customer) mgr.createNamedQuery("Customer.findByUsername").setParameter("username", username).getSingleResult();
        } catch (EntityExistsException ex) {
            Logger.getLogger(CustomerService.class.getName()).log(Level.SEVERE, "No record found!", ex);
        } catch (Exception ex) {
            Logger.getLogger(CustomerService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void deleteCustomer(String id) {
        Customer customer = findCustomerById(id);
        if (customer != null) {
            mgr.remove(customer);
        }
    }
    
    public List<Customer> findAll() {
        List customerList = mgr.createNamedQuery("Customer.findAll").getResultList();
        return customerList;
    }
    
    public Customer updateCustomer(Customer customer) {
        return (Customer) mgr.merge(customer);
    }
}
