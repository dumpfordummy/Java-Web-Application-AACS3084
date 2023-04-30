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

    public CartPK(Integer cartid, String customerid, Integer productid, Integer qty) {
        this.cartid = cartid;
        CustomerService customerService = new CustomerService(mgr);
        System.out.print("customerid = " + customerid);
        this.customer = customerService.findCustomerById(customerid);
        ProductService productService = new ProductService(mgr);
        this.product = productService.findProductByProductid(productid);
        this.qty = qty;
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
