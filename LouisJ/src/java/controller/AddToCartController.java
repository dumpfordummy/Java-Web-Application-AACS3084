/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.IOException;
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
import model.CartService;
import model.Customer;
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
            List<Cart> cartList = cartService.findAllDesc();
            int lastCartid;
            if (cartList.isEmpty()) {
                lastCartid = 0;
            } else {
                lastCartid = cartList.get(0).getCartid();
            }

            HttpSession session = request.getSession();
            UserSessionUtil userSession = new UserSessionUtil(session);
            User user = userSession.getUserSession(request.getCookies());
            if(user == null || !user.getUserRole().equals(User.CUSTOMER)) {
                response.sendRedirect("/login");
                return;
            }
            user = (Customer) user;
            String customerid = user.getUserId();
            System.out.print(user.getUserId());
            System.out.print(user.getUserRole());
            System.out.print(user.getUsername());
            
            
//            int productid = Integer.parseInt(request.getParameter("productid"));
//            
//            List<Cart> customerCartList = cartService.findCartByCustomerid(customerid);
//            for(Cart customerCart : customerCartList){
//                if(customerCart.getProductid().equals(productid)){
//                    response.sendRedirect("/product");
//                    return;
//                }
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
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
