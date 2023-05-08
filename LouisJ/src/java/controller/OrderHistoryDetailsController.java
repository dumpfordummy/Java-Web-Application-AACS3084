/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.CartService;
import model.Product;
import model.ProductService;

/**
 *
 * @author CY
 */
@WebServlet(name = "OrderHistoryDetails", urlPatterns = {"/orderHistoryDetails"})
public class OrderHistoryDetailsController extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer paymentId = Integer.valueOf(request.getParameter("paymentId"));

            CartService cartService = new CartService(em);
            ProductService productService = new ProductService(em);
            List<Cart> carts = cartService.findByPaymentid(paymentId);
            List<Product> products = new ArrayList<>();
            for (Cart cart : carts) {
                Integer productId = cart.getProductid();
                products.add(productService.findByProductid(productId));
            }
            
            request.setAttribute("orderCarts", carts);
            request.setAttribute("orderProducts", products);

            request.getRequestDispatcher("/orderDetails.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
