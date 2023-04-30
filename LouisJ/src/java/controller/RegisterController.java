/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;
import util.hashUtil;

/**
 *
 * @author CY
 */
@MultipartConfig
public class RegisterController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    private static final String REGISTERPAGE = "/register.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(REGISTERPAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        CustomerService customerService = new CustomerService(em);

        Customer customer = customerService.findCustomerByUsername(username);

        if (customer == null) {
            try {
                customer = new Customer();
                String id = UUID.randomUUID().toString();
                String passwordHash = hashUtil.getHashed(password, id);
                customer.setId(id);
                customer.setUsername(username);
                customer.setPasswordhash(passwordHash);
                customer.setFullname(name);
                customer.setEmail(email);
                customer.setContact(contact);
                customer.setAddress(address);

                Part imagePart = request.getPart("profileImg");

                if (imagePart != null) {
                    File targetFile;
                    String rootPath = System.getProperty("catalina.home");
                    try (
                            InputStream imageContent = imagePart.getInputStream()) {
                        targetFile = new File(rootPath + File.separator +  customer.getUsername() + ".jpg");
                        if(!targetFile.exists()) targetFile.mkdirs();
                        Files.copy(imageContent, targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                    }
                    
                    customer.setProfileimg(targetFile);
                    customer.setProfileimgtype(imagePart.getContentType());
                }

                utx.begin();
                boolean isRegisterSuccess = customerService.addCustomer(customer);
                utx.commit();
                if (isRegisterSuccess) {
                    out.print("RegisterSuccessfully");
                    return;
                }
            } catch (NotSupportedException | SystemException | javax.transaction.RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        out.print("Failed to register");
    }
}
