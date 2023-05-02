/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;
import model.Employee;
import model.EmployeeService;
import util.UserSessionUtil;

/**
 *
 * @author CY
 */
@WebServlet(urlPatterns = {"/profile", "/profile/*"})
public class ProfileController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    private static final String PROFILEPAGE = "/profile.jsp";
    private static final String PROFILEEDITPAGE = "/profileEdit.jsp";
    private static final String ERRORPAGE = "/error.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] paths = request.getRequestURI().substring(1).split("/");
        if (paths.length == 1) {
            request.getRequestDispatcher(PROFILEPAGE).forward(request, response);
            return;
        }

        request.getRequestDispatcher(PROFILEEDITPAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String[] paths = request.getRequestURI().substring(1).split("/");

            String action = paths[1];

            String userId = paths[2];

            UserSessionUtil userSession = new UserSessionUtil(request.getSession());
            User user = userSession.getCurrentLoginUser(request.getCookies());

            if (user != null) {
                user.setUsername(request.getParameter("username"));
                user.setFullname(request.getParameter("name"));
                user.setEmail(request.getParameter("email"));
                user.setContact(request.getParameter("contact"));
                user.setAddress(request.getParameter("address "));
                Method method = ProfileController.class.getDeclaredMethod(action + "Profile");
                method.invoke(null, user);
                response.sendRedirect(PROFILEPAGE);
            } else {
                request.setAttribute("errorTitle", "Error");
                request.setAttribute("errorMessage", "User not found, please login.");
                request.getRequestDispatcher(ERRORPAGE).forward(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editProfile(User user) {
        if (user.getUsertype().equals(User.CUSTOMER)) {
            Customer customer = (Customer) user;

            CustomerService customerService = new CustomerService(em);
            customerService.updateCustomer(customer);

        } else {
            Employee employee = (Employee) user;
            EmployeeService employeeService = new EmployeeService(em);
            employeeService.updateEmployee(employee);
        }
    }

}
