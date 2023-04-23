/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;
import util.hashUtil;

/**
 *
 * @author CY
 */
public class RegisterController extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    private static final String REGISTERPG = "/register.jsp";
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(REGISTERPG).forward(req, res);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");

        PrintWriter out = res.getWriter();
        String username = req.getParameter("uname");
        String password = req.getParameter("upass");
        CustomerService customerService = new CustomerService(em);
        
        Customer customer = customerService.findCustomerByUsername(username);
        
        if(customer == null) {
            customer = new Customer();
            String id = UUID.randomUUID().toString();
            String passwordHash = hashUtil.getHashed(password, id);
            customer.setId(id);
            customer.setUsername(username);
            customer.setPasswordhash(passwordHash);
            if(customerService.addCustomer(customer)) {
                out.print("RegisterSuccessfully");
                return;
            }
        }
        
        out.print("Failed to register");
    }
}
