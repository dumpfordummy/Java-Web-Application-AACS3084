/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import model.CustomerService;
import model.Payment;
import model.PaymentService;
import model.Product;
import model.ProductService;
import util.UserSessionUtil;

/**
 *
 * @author Asus
 */
public class CheckoutController extends HttpServlet {
    
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String shippingAddress = request.getParameter("shippingAddress");
            String paymentMethod = request.getParameter("paymentMethod");
            if (paymentMethod.equals("CARD")) {
                String cardNumber = request.getParameter("cardNumber");
                String expDateStr = request.getParameter("expDate");
                String CVV = request.getParameter("CVV");
                if(cardNumber.equals("") || expDateStr.equals("") || CVV.equals("")){
                    
                    response.sendRedirect("/cartPayment?error=empty");
                    return;
                }
            }
            String status = request.getParameter("status");
            double subTotal = Double.parseDouble(request.getParameter("subTotal"));
            double tax = Double.parseDouble(request.getParameter("tax"));
            double deliveryCharge = Double.parseDouble(request.getParameter("deliveryCharge"));
            double discountAmount = Double.parseDouble(request.getParameter("discountAmount"));
            double totalPayment = Double.parseDouble(request.getParameter("totalPayment"));
            
            PaymentService paymentService = new PaymentService(em);
            List<Payment> paymentList = paymentService.findAllDesc();
            int lastPaymentid;
            if (paymentList.isEmpty()) {
                lastPaymentid = 0;
            } else {
                lastPaymentid = paymentList.get(0).getPaymentid();
            }
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
            List<Cart> customerCartList = cartService.findByCustomerid(customerid);
            for (Cart cart : customerCartList) {
                if (cart.getPaymentid() == null) {
                    cart.setPaymentid(lastPaymentid + 1);
                    utx.begin();
                    cartService.updateCart(cart);
                    utx.commit();
                }
            }
            

            Date orderDate = new Date();
            Payment payment = new Payment();
            payment.setPaymentid(lastPaymentid + 1);
            payment.setCustomerid(customerid);
            payment.setShippingaddress(shippingAddress);
            payment.setPaymentmethod(paymentMethod);
            payment.setStatus(status);
            payment.setsubTotal(subTotal);
            payment.setTax(tax);
            payment.setDeliveryCharge(deliveryCharge);
            payment.setDiscountAmount(discountAmount);
            payment.setTotalPayment(totalPayment);
            payment.setOrderDate(orderDate);
            

            utx.begin();
            boolean success = paymentService.addPayment(payment);
            utx.commit();

            response.sendRedirect("/product");
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("/cartPayment");
        }
    }
}
