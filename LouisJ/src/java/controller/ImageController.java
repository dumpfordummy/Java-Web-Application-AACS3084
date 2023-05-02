/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.CustomerService;
import model.EmployeeService;

/**
 *
 * @author CY
 */
// handle path of /image/{userrole}/{userid}
public class ImageController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] paths = request.getRequestURI().substring(1).split("/");
        if (paths.length != 3) {
            return;
        }
        String userRole = paths[1];
        String userId = paths[2];
        User user;
        

        if (userRole.equals(User.CUSTOMER)) {
            CustomerService customerService = new CustomerService(em);
            user = customerService.findCustomerById(userId);
        } else {
            EmployeeService employeeService = new EmployeeService(em);
            user = employeeService.findEmployeeById(userId);
        }
        response.setContentType(user.getProfileimgtype());

        String profileImage = user.getProfileimg();
  
        byte[] profileImageByteArray = Base64.getDecoder().decode(profileImage);

        response.getOutputStream().write(profileImageByteArray);
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
