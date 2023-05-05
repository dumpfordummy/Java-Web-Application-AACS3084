/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.ProductService;

/**
 *
 * @author Pua
 */
public class HomePageController extends HttpServlet {
    
    @PersistenceContext
    EntityManager em;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService(em);
        
        List<Product> allProducts = new ArrayList<>();
        List<Product> productList = productService.findAllDesc();
        List<String> categories = productService.findAllCategory();
        categories.forEach((n) -> allProducts.add(productService.findFirstProductImageByCategory(n)));
        request.setAttribute("productList", productList);
//        request.setAttribute("categories", categories);
        request.setAttribute("allProducts", allProducts);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/homePage.jsp");
        dispatcher.forward(request, response);
    }
}
