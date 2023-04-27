/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.ProductService;

/**
 *
 * @author Asus
 */
public class ProductDetailController extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productid = Integer.parseInt(request.getParameter("productid"));
            
            ProductService productService = new ProductService(em);
            Product product = productService.findProductByProductId(productid);
            
            HttpSession session = request.getSession();
            session.setAttribute("product", product);
            response.sendRedirect(request.getContextPath() + "/productDetail.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
