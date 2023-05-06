/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Base64;
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
import util.ImageUtil;
import util.UserSessionUtil;
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
    private static final String HOMEPAGE = "/home";
    private static final String LOGINPAGE = "/login";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(REGISTERPAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserSessionUtil userSession = new UserSessionUtil(request.getSession());
        User user = userSession.getCurrentLoginUser(request.getCookies());
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

                String base64Image = ImageUtil.getImageBase64(imagePart);

                customer.setProfileimg(base64Image);
                customer.setProfileimgtype(imagePart.getContentType());

                utx.begin();
                boolean isRegisterSuccess = customerService.addCustomer(customer);
                utx.commit();
                if (isRegisterSuccess && user != null && !user.getUsertype().equals(User.MANAGER)) {
                    response.sendRedirect(LOGINPAGE);
                    return;
                }
            } catch (NotSupportedException | SystemException | javax.transaction.RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
            }
        }

        response.sendRedirect(HOMEPAGE);
    }
}
