/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Asus
 */
public class CartPK {
    @PersistenceContext
    EntityManager mgr;
    
    private Integer cartid;
    private Customer customer;
    private Product product;
    private Integer qty;

    public CartPK() {
    }

    public CartPK(Integer cartid) {
        this.cartid = cartid;
        CartService cartService = new CartService(mgr);
        Cart cart = cartService.findCartByCartid(cartid);
        CustomerService customerService = new CustomerService(mgr);
        this.customer = customerService.findCustomerById(cart.getCustomerid());
        ProductService productService = new ProductService(mgr);
        this.product = productService.findProductByProductid(cart.getProductid());
        this.qty = cart.getQty();
    }

    public Integer getCartid() {
        return cartid;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }
    
    
    
    
}
