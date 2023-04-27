/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

/**
 *
 * @author Asus
 */
public class ProductService {
    
    @PersistenceContext
    EntityManager mgr;
    
    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addProduct(Product product) {
        mgr.persist(product);
        return true;
    }

    public Product findProductByProductId(int productId) {
        Product product = mgr.find(Product.class, productId);
        return product;
    }

    public boolean deleteProduct(int productId) {
        Product product = findProductByProductId(productId);
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

    public boolean updateProduct(Product product) {
        Product tempProduct = findProductByProductId(product.getProductid());
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
