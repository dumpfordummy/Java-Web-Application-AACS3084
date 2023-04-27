/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.UserRole;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Cart;
import model.CartService;
import model.Customer;
import model.Product;
import model.ProductService;
import util.UserSessionUtil;

/**
 *
 * @author Asus
 */
public class AddToCartController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            CartService cartService = new CartService(em);
            Cart lastCart = cartService.findLastCart();
            int lastCartId = lastCart.getCartid();

            HttpSession session = request.getSession();
            UserSessionUtil userSession = new UserSessionUtil(session);
            UserRole user = userSession.getUserSession(request.getCookies());

            if(user.getUserRole() == null || !user.getUserRole().equals(UserRole.CUSTOMER)) {
                response.sendRedirect("/login");
            }
            
            user = (Customer) user;
            String customerid = user.getUserId();
            
//            int productid = Integer.parseInt(request.getAttribute("productid"));
            
//            utx.begin();
//            boolean success = productService.addProduct(product);
//            utx.commit();
//
//            HttpSession session = request.getSession();
//            session.setAttribute("success", success);
//            response.sendRedirect("/product");
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
