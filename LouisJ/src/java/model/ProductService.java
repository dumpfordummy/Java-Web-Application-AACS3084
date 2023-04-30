/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.persistence.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Asus
 */
public class ProductService {

    @PersistenceContext
    EntityManager mgr;

    public ProductService() {}
    
    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addProduct(Product product) {
        mgr.persist(product);
        return true;
    }

    public Product findProductByProductid(int productid) {
        Product product = mgr.find(Product.class, productid);
        return product;
    }

    public boolean deleteProduct(int productid) {
        Product product = findProductByProductid(productid);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
    }

    public List<Product> findAll() {
        List<Product> productList = mgr.createNamedQuery("Product.findAll", Product.class).getResultList();
        return productList;
    }

    public List<Product> findByName(String name) {
        TypedQuery<Product> query = mgr.createNamedQuery("Product.findByName", Product.class);
        query.setParameter("name", name);
        return query.getResultList();
    }

    public List<Product> findByNamePattern(String namePattern) {
        TypedQuery<Product> query = mgr.createNamedQuery("Product.findByNamePattern", Product.class);
        query.setParameter("namePattern", "%" + namePattern + "%");
        return query.getResultList();
    }

    public List<Product> findByCategory(String category) {
        TypedQuery<Product> query = mgr.createNamedQuery("Product.findByCategory", Product.class);
        query.setParameter("category", category);
        return query.getResultList();
    }

//    public List<String> findAllCategories() {
//        TypedQuery<String> query = mgr.createNamedQuery("Product.findAllCategory", String.class);
//        return query.getResultList();
//    }

    public boolean updateProduct(Product product) {
        Product tempProduct = findProductByProductid(product.getProductid());
        if (tempProduct != null) {
            tempProduct.setName(product.getName());
            tempProduct.setImage(product.getImage());
            tempProduct.setDescription(product.getDescription());
            tempProduct.setPrice(product.getPrice());
            return true;
        }
        return false;
    }

}
