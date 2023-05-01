/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author Wai Loc
 */
public class OrderService {
    @PersistenceContext EntityManager em;
    
    public OrderService(EntityManager em){
        this.em = em;
    }
    
    public boolean addOrder(Order orders){
        em.persist(orders);
        return true;
    }
    
    public Order findOrderByOrderID(int orderID){
        Order order = em.find(Order.class, orderID);
        return order;
    }
    
    public boolean deleteOrder(Order orders){
        em.remove(orders);
        return true;
    }
    
    public List<Order> findOrderByStatus(String status){
        TypedQuery<Order> query = em.createNamedQuery("Order1.findByStatus", Order.class);
        query.setParameter("status", status);
        return query.getResultList();
    }
    
}
