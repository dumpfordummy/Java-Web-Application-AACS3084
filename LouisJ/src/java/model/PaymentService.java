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
public class PaymentService {
    @PersistenceContext
    EntityManager mgr;

    public PaymentService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addPayment(Payment payment) {
        try {
            mgr.persist(payment);
        } catch (EntityExistsException ex) {
            Logger.getLogger(PaymentService.class.getName()).log(Level.SEVERE, "Error in adding entity, duplicated entity found", ex);
            return false;
        } catch (IllegalArgumentException | TransactionRequiredException ex) {
            Logger.getLogger(PaymentService.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    public Payment findPaymentByPaymentid(int paymentid) {
        Payment payment = mgr.find(Payment.class, paymentid);
        return payment;
    }

    public List<Payment> findByCustomerid(String customerid) {
        try {
            return (List<Payment>) mgr.createNamedQuery("Payment.findByCustomerid").setParameter("customerid", customerid).getResultList();
        } catch (EntityExistsException ex) {
            Logger.getLogger(PaymentService.class.getName()).log(Level.SEVERE, "No record found!", ex);
        } catch (Exception ex) {
            Logger.getLogger(PaymentService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public List<Payment> findByStatus(String status) {
        try {
            return (List<Payment>) mgr.createNamedQuery("Payment.findByStatus").setParameter("status", status).getResultList();
        } catch (EntityExistsException ex) {
            Logger.getLogger(PaymentService.class.getName()).log(Level.SEVERE, "No record found!", ex);
        } catch (Exception ex) {
            Logger.getLogger(PaymentService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean deletePayment(int paymentid) {
        Payment payment = findPaymentByPaymentid(paymentid);
        if (payment != null) {
            mgr.remove(payment);
            return true;
        }
        return false;
    }

    public List<Payment> findAll() {
        List paymentList = mgr.createNamedQuery("Payment.findAll").getResultList();
        return paymentList;
    }

    public List<Payment> findAllDesc() {
        List paymentList = mgr.createNamedQuery("Payment.findAllDesc").getResultList();
        return paymentList;
    }

    public boolean updatePayment(Payment payment) {
        Payment tempPayment = findPaymentByPaymentid(payment.getPaymentid());
        if (tempPayment != null) {
            tempPayment.setCustomerid(payment.getCustomerid());
            mgr.merge(tempPayment);
            return true;
        }
        return false;
    }
}
