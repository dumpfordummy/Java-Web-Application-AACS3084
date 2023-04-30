/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartPK;
import model.CartService;
import model.Customer;
import model.ProductService;
import util.UserSessionUtil;

/**
 *
 * @author Asus
 */
public class CartPaymentController extends HttpServlet {
    
    @PersistenceContext
    EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserSessionUtil userSession = new UserSessionUtil(session);
        User user = userSession.getCurrentLoginUser(request.getCookies());
        if (user == null || !user.getUsertype().equals(User.CUSTOMER)) {
            response.sendRedirect("/login");
            return;
        }
        user = (Customer) user;
        String customerid = user.getId();
        
        CartService cartService = new CartService(em);
        List<Cart> customerCartList = cartService.findCartByCustomerid(customerid);
        List<CartPK> cartPKList = new ArrayList<>();
        for(Cart cart : customerCartList){
            cartPKList.add(new CartPK(cart.getCartid()));
        }
        

        
        request.setAttribute("cartPKList", cartPKList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cartPayment.jsp");
        dispatcher.forward(request, response);
        
    }
}
