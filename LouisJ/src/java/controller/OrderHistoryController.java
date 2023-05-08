/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Payment;
import model.PaymentService;
import util.UserSessionUtil;

/**
 *
 * @author CY
 */
@WebServlet(name = "OrderHistoryController", urlPatterns = {"/orderHistory"})
public class OrderHistoryController extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PaymentService paymentService = new PaymentService(em);
        List<Payment> paymentList = paymentService.findAll();
        request.setAttribute("paymentList", paymentList);
        
        UserSessionUtil userSession = new UserSessionUtil(request.getSession());
        User user = userSession.getCurrentLoginUser(request.getCookies());

        if (user != null && user.getUsertype().equals(User.CUSTOMER)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/orderHistory.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorTitle", "Forbidden Access");
            request.setAttribute("errorMessage", "You do not have access to this page.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
