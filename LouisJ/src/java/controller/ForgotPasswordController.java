/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;
import util.hashUtil;

/**
 *
 * @author CY
 */
@WebServlet(name = "ForgotPasswordController", urlPatterns = {"/forgot"})
public class ForgotPasswordController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    private static final String FORGOTPASSWORDPAGE = "/forgotPassword.jsp";
    private static final String HOMEPAGE = "/home";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(FORGOTPASSWORDPAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            CustomerService customerService = new CustomerService(em);

            Customer customer = customerService.findCustomerByUsername(username);
            System.out.println("null");
            if (customer != null) {
                System.out.println("not null");
                String id = customer.getId();
                String passwordHash = hashUtil.getHashed(password, id);
                System.out.println("old hash:" + customer.getPasswordhash());
                System.out.println("new hash:" + passwordHash);
                
                customer.setPasswordhash(passwordHash);

                utx.begin();
                customerService.updateCustomer(customer);
                utx.commit();
                
                response.sendRedirect(HOMEPAGE);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
