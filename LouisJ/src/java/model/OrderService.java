/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityExistsException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TransactionRequiredException;

/**
 *
 * @author Asus
 */
public class OrderService {
    @PersistenceContext
    EntityManager mgr;

    public OrderService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addOrder(Order order) {
        try {
            mgr.persist(order);
        } catch (EntityExistsException ex) {
            Logger.getLogger(OrderService.class.getName()).log(Level.SEVERE, "Error in adding entity, duplicated entity found", ex);
            return false;
        } catch (IllegalArgumentException | TransactionRequiredException ex) {
            Logger.getLogger(OrderService.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    public Order findOrderByOrderid(int orderid) {
        Order order = mgr.find(Order.class, orderid);
        return order;
    }

    public List<Order> findByCustomerid(String customerid) {
        try {
            return (List<Order>) mgr.createNamedQuery("Order.findByCustomerid").setParameter("customerid", customerid).getResultList();
        } catch (EntityExistsException ex) {
            Logger.getLogger(OrderService.class.getName()).log(Level.SEVERE, "No record found!", ex);
        } catch (Exception ex) {
            Logger.getLogger(OrderService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean deleteOrder(int orderid) {
        Order order = findOrderByOrderid(orderid);
        if (order != null) {
            mgr.remove(order);
            return true;
        }
        return false;
    }

    public List<Order> findAll() {
        List orderList = mgr.createNamedQuery("Order.findAll").getResultList();
        return orderList;
    }

    public List<Order> findAllDesc() {
        List orderList = mgr.createNamedQuery("Order.findAllDesc").getResultList();
        return orderList;
    }

    public boolean updateOrder(Order order) {
        Order tempOrder = findOrderByOrderid(order.getOrderid());
        if (tempOrder != null) {
            tempOrder.setCustomerid(order.getCustomerid());
            mgr.merge(tempOrder);
            return true;
        }
        return false;
    }
}
