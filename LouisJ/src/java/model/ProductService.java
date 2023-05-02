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

    public ProductService() {
    }

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

    public List<Product> findAllDesc() {
        List productList = mgr.createNamedQuery("Product.findAllDesc").getResultList();
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

    public Product findFirstProductImageByCategory(String category) {
        TypedQuery<Product> query = mgr.createNamedQuery("Product.findFirstProductImageByCategory", Product.class);
        query.setParameter("category", category);
        return query.getSingleResult();
    }

    public List<Product> findByCategoryAndPriceRange(String category, Double priceRange) {
        TypedQuery<Product> query = mgr.createNamedQuery("Product.findByCategoryAndPriceRange", Product.class);
        query.setParameter("category", category);
        query.setParameter("priceRange", priceRange);
        return query.getResultList();
    }

    public Double findMaxPrice() {
        TypedQuery<Double> query = mgr.createNamedQuery("Product.findMaxPrice", Double.class);
        return query.getSingleResult();
    }

    public List<Product> findByPriceRange(Double priceRange) {
        TypedQuery<Product> query = mgr.createNamedQuery("Product.findByPriceRange", Product.class);
        query.setParameter("priceRange", priceRange);
        return query.getResultList();
    }

    public List<String> findAllCategory() {
        TypedQuery<String> query = mgr.createNamedQuery("Product.findAllCategory", String.class);
        return query.getResultList();
    }

    public boolean updateProduct(Product product) {
        Product tempProduct = findProductByProductid(product.getProductid());
        if (tempProduct != null) {
            tempProduct.setName(product.getName());
            tempProduct.setDescription(product.getDescription());
            tempProduct.setCategory(product.getCategory());
            tempProduct.setPrice(product.getPrice());
            tempProduct.setImage(product.getImage());
            return true;
        }
        return false;
    }

}
