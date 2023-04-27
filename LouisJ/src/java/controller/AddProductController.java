/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.*;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

import model.Product;
import model.ProductService;

/**
 *
 * @author Asus
 */
public class AddProductController extends HttpServlet {
    
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productid = Integer.parseInt(request.getParameter("productid"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String type = request.getParameter("type");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));

            Product product = new Product();
            product.setProductid(productid);
            product.setName(name);
            product.setDescription(description);
            product.setType(type);
            product.setCategory(category);
            product.setPrice(price);
            
            ProductService productService = new ProductService(em);
            utx.begin();
            boolean success = productService.addProduct(product);
            utx.commit();
            
            response.sendRedirect("/product");
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/addProduct.jsp");
    }
}
