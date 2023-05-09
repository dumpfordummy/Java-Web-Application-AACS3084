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
public class CartService {

    @PersistenceContext
    EntityManager mgr;

    public CartService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addCart(Cart cart) {
        try {
            mgr.persist(cart);
        } catch (EntityExistsException ex) {
            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, "Error in adding entity, duplicated entity found", ex);
            return false;
        } catch (IllegalArgumentException | TransactionRequiredException ex) {
            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    public Cart findCartByCartid(int cartid) {
        Cart cart = mgr.find(Cart.class, cartid);
        return cart;
    }

    public List<Cart> findByCustomerid(String customerid) {
        try {
            return (List<Cart>) mgr.createNamedQuery("Cart.findByCustomerid").setParameter("customerid", customerid).getResultList();
        } catch (EntityExistsException ex) {
            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, "No record found!", ex);
        } catch (Exception ex) {
            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean deleteCart(int cartid) {
        Cart cart = findCartByCartid(cartid);
        if (cart != null) {
            mgr.remove(cart);
            return true;
        }
        return false;
    }

    public List<Cart> findAll() {
        List cartList = mgr.createNamedQuery("Cart.findAll").getResultList();
        return cartList;
    }

    public List<Cart> findAllPaid() {
        List cartList = mgr.createNamedQuery("Cart.findAllPaid").getResultList();
        return cartList;
    }

    public List<Cart> findAllDesc() {
        List cartList = mgr.createNamedQuery("Cart.findAllDesc").getResultList();
        return cartList;
    }

    public List<Cart> findByProductid(Integer productid) {
        try {
            return (List<Cart>) mgr.createNamedQuery("Cart.findByProductid").setParameter("productid", productid).getResultList();
        } catch (EntityExistsException ex) {
            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, "No record found!", ex);
        } catch (Exception ex) {
            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Cart> findAllOrderByProductid() {
        List cartList = mgr.createNamedQuery("Cart.findAllOrderByProductid").getResultList();
        return cartList;
    }

    public List<Cart> findByPaymentid(Integer paymentid) {
        try {
            return (List<Cart>) mgr.createNamedQuery("Cart.findByPaymentid").setParameter("paymentid", paymentid).getResultList();
        } catch (EntityExistsException ex) {
            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, "No record found!", ex);
        } catch (Exception ex) {
            Logger.getLogger(CartService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Integer findCountByProductCategory(String category) {
        Integer count = ((Number) mgr.createNamedQuery("Cart.findCountByProductCategory").setParameter("category", category).getSingleResult()).intValue();
        return count;
    }

    public List<Cart> findAllByProductCategory(String category) {
        return (List<Cart>) mgr.createNamedQuery("Cart.findAllByProductCategory").setParameter("category", category).getResultList();
    }
    
    public boolean updateCart(Cart cart) {
        Cart tempCart = findCartByCartid(cart.getCartid());
        if (tempCart != null) {
            tempCart.setCustomerid(cart.getCustomerid());
            tempCart.setProductid(cart.getProductid());
            tempCart.setQty(cart.getQty());
            tempCart.setPaymentid(cart.getPaymentid());
            mgr.merge(tempCart);
            return true;
        }
        return false;
    }

}
