/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class FilterCategoryController extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductService productService = new ProductService(em);
        String category = request.getParameter("category");
        category = category.toUpperCase();
        if (category.equals("ALL")) {
            List<Product> productList = productService.findAll();
            request.setAttribute("productList", productList);
            request.setAttribute("category", category);
        } else {
            List<Product> productList = productService.findByCategory(category);
            request.setAttribute("productList", productList);
            request.setAttribute("category", category);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product.jsp");
        dispatcher.forward(request, response);
    }
}
