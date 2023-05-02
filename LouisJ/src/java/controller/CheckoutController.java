/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import model.CartPK;
import model.CartService;
import model.Customer;
import model.Order;
import model.OrderService;
import util.UserSessionUtil;

/**
 *
 * @author Asus
 */
public class CheckoutController extends HttpServlet {
//    
//    @PersistenceContext
//    EntityManager em;
//    @Resource
//    UserTransaction utx;
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            OrderService orderService = new OrderService(em);
//            List<Order> orderList = orderService.findAllDesc();
//            int lastOrderid;
//            if (orderList.isEmpty()) {
//                lastOrderid = 0;
//            } else {
//                lastOrderid = orderList.get(0).getOrderid();
//            }
//            HttpSession session = request.getSession();
//            UserSessionUtil userSession = new UserSessionUtil(session);
//            User user = userSession.getCurrentLoginUser(request.getCookies());
//            if (user == null || !user.getUsertype().equals(User.CUSTOMER)) {
//                response.sendRedirect("/login");
//                return;
//            }
//            user = (Customer) user;
//            String customerid = user.getId();
//
//            List<CartPK> cartPKList = (List<CartPK>) request.getAttribute("cartPKList");
//
//            CartService cartService = new CartService(em);
//            Cart cart = new Cart();
//            for (CartPK cartPK : cartPKList) {
//                cart.setCartid(cartPK.getCartid());
//                cart.setCustomerid(cartPK.getCustomer().getId());
//                cart.setProductid(cartPK.getProduct().getProductid());
//                cart.setQty(cartPK.getQty());
//                cart
//                cartService.updateCart(cart);
//            }
//
//            Cart cart = new Cart();
//            cart.setCartid(lastCartid + 1);
//            cart.setCustomerid(customerid);
//            cart.setProductid(productid);
//            cart.setQty(1);
//
//            utx.begin();
//            boolean success = cartService.addCart(cart);
//            utx.commit();
//
//            response.sendRedirect("/product");
//        } catch (Exception ex) {
//            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//    
}
