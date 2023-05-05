/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Payment;
import model.PaymentService;
import util.UserSessionUtil;


/**
 *
 * @author frost
 */
@WebServlet(urlPatterns = {"/orderUpdate"})
public class OrderUpdateController extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PaymentService paymentService = new PaymentService(em);
        int paymentId = Integer.parseInt(request.getParameter("PaymentID"));
        Payment payment = paymentService.findPaymentByPaymentid(paymentId);
        request.setAttribute("payment", payment);
        
        UserSessionUtil userSession = new UserSessionUtil(request.getSession());
        User user = userSession.getCurrentLoginUser(request.getCookies());
        if (user != null){
            if (user.getUsertype().equals(User.MANAGER) || user.getUsertype().equals(User.STAFF)){
                RequestDispatcher dispatcher = request.getRequestDispatcher("/orderUpdate.jsp");
                dispatcher.forward(request, response);
            }
            else {
                request.setAttribute("errorTitle", "Forbidden Access");
                request.setAttribute("errorMessage", "You are logged in as " + user.getUsertype() + ", hence you do not have access to this page.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
                dispatcher.forward(request, response);
            }
        }
        else {
            request.setAttribute("errorTitle", "Forbidden Access");
            request.setAttribute("errorMessage", "You are not logged in, hence you do not have access to this page.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Payment payment = new Payment();
            PaymentService paymentService = new PaymentService(em);
            UserSessionUtil userSession = new UserSessionUtil(request.getSession());
            User user = userSession.getCurrentLoginUser(request.getCookies());
            
            int paymentId = Integer.parseInt(request.getParameter("PaymentID"));
            String status = request.getParameter("orderStatus");
            payment = paymentService.findPaymentByPaymentid(paymentId);
            payment.setStatus(status);
            payment.setEmployeeid(user.getId());

            utx.begin();
            boolean success = paymentService.updatePayment(payment);
            utx.commit();
            
            if (success){
                request.setAttribute("updateSuccess", Boolean.TRUE);
                request.getRequestDispatcher("/orderList").forward(request, response);
            }
        }
        catch(Exception ex){
            Logger.getLogger(OrderUpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
