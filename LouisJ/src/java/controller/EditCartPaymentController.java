/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Cart;
import model.CartService;
import model.Product;
import model.ProductService;

/**
 *
 * @author Asus
 */
public class EditCartPaymentController extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int cartid = Integer.parseInt(request.getParameter("cartid"));
            int cartQty = Integer.parseInt(request.getParameter("cartQty"));

            CartService cartService = new CartService(em);

            Cart cart = cartService.findCartByCartid(cartid);
            cart.setQty(cartQty);

            utx.begin();
            boolean success = cartService.updateCart(cart);
            utx.commit();
            
            response.sendRedirect("/cartPayment");
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
