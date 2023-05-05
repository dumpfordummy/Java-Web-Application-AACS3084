/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import interfaces.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.Iterator;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;
import model.Employee;
import model.EmployeeService;
import util.ImageUtil;
import util.UserSessionUtil;

/**
 *
 * @author CY
 */

/*
USER
 GET
  - /profile: get current user's profile page
  - /profile/edit: get current user's profile edit page

 POST
  - /profile/edit/{target_usertype}/{userid}: edit profile with given user details

MANAGER
 GET
  - /profile/{edit OR delete}/{target_usertype}/{target_userid}: get specific user's edit page
 */
@MultipartConfig
@WebServlet(name = "ProfileController", urlPatterns = {"/profile/*"})
public class ProfileController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    private static final String PROFILEPAGE = "/profile.jsp";
    private static final String PROFILEEDITPAGE = "/profileEdit.jsp";
    private static final String ERRORPAGE = "/error.jsp";
    private static final String PROFILECONFIRMATIONPAGE = "/profileConfirmation.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserSessionUtil userSession = new UserSessionUtil(request.getSession());
            User user = userSession.getCurrentLoginUser(request.getCookies());

            String[] paths = request.getRequestURI().substring(1).split("/");
            if (paths.length == 1) {
                request.getRequestDispatcher(PROFILEPAGE).forward(request, response);
                return;
            } else if (paths.length == 2) {
                request.getRequestDispatcher(PROFILEEDITPAGE).forward(request, response);
                return;
            }

            if (user.getUsertype().equals(User.MANAGER) && paths.length == 4) {
                String action = paths[1];
                String targetUserType = paths[2];
                String targetUserId = paths[3];

                if ("edit".equals(action)) {
                    editUserPage(request, response, targetUserType, targetUserId);
                } else if ("delete".equals(action)) {
                    deleteUser(request, response, targetUserType, targetUserId);
                }
            }
        } catch (Exception ex) {
            request.setAttribute("errorTitle", "Error!");
            request.setAttribute("errorTitle", ex.getMessage());
            request.getRequestDispatcher(ERRORPAGE).forward(request, response);
        }

    }

    private void editUserPage(HttpServletRequest request, HttpServletResponse response, String targetUserType, String targetUserId) throws ServletException, IOException {
        if (targetUserType.equals(User.CUSTOMER)) {
            CustomerService customerService = new CustomerService(em);
            Customer customer = customerService.findCustomerById(targetUserId);

            request.setAttribute("user", customer);

        } else {
            EmployeeService employeeService = new EmployeeService(em);
            Employee employee = employeeService.findEmployeeById(targetUserId);

            request.setAttribute("user", employee);
        }
        request.getRequestDispatcher(PROFILEEDITPAGE).forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response, String targetUserType, String targetUserId) throws ServletException, IOException, SystemException, IllegalStateException, SecurityException, HeuristicRollbackException, HeuristicMixedException, RollbackException, NotSupportedException {
        if (targetUserType.equals(User.CUSTOMER)) {
            CustomerService customerService = new CustomerService(em);
            utx.begin();
            customerService.deleteCustomer(targetUserId);
            utx.commit();
        } else {
            EmployeeService employeeService = new EmployeeService(em);
            utx.begin();
            employeeService.deleteEmployee(targetUserId);
            utx.commit();
        }
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            System.out.println(request.getHeader(headerNames.nextElement()));
        }
        request.setAttribute("action", "deleted");

        request.getRequestDispatcher(PROFILECONFIRMATIONPAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String[] paths = request.getRequestURI().substring(1).split("/");

            String userType = paths[2];
            String userId = paths[3];

            String username = request.getParameter("username");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String address = request.getParameter("address");

            Part imagePart = request.getPart("profileImg");

            if (userType.equals(User.CUSTOMER)) {
                CustomerService customerService = new CustomerService(em);
                Customer customer = customerService.findCustomerById(userId);

                if (username != null) {
                    customer.setUsername(username);
                }
                if (fullname != null) {
                    customer.setFullname(fullname);
                }
                if (email != null) {
                    customer.setEmail(email);
                }
                if (contact != null) {
                    customer.setContact(contact);
                }
                if (address != null) {
                    customer.setAddress(address);
                }
                if (!Paths.get(imagePart.getSubmittedFileName()).getFileName().toString().equals("")) {
                    String base64Image = ImageUtil.getImageBase64(imagePart);
                    customer.setProfileimg(base64Image);
                }

                utx.begin();
                customerService.updateCustomer(customer);
                utx.commit();
            } else {
                EmployeeService employeeService = new EmployeeService(em);
                Employee employee = employeeService.findEmployeeById(userId);

                if (username != null) {
                    employee.setUsername(username);
                }
                if (fullname != null) {
                    employee.setFullname(fullname);
                }
                if (email != null) {
                    employee.setEmail(email);
                }
                if (contact != null) {
                    employee.setContact(contact);
                }
                if (address != null) {
                    employee.setAddress(address);
                }
                if (!Paths.get(imagePart.getSubmittedFileName()).getFileName().toString().equals("")) {
                    String base64Image = ImageUtil.getImageBase64(imagePart);
                    employee.setProfileimg(base64Image);
                }

                utx.begin();
                employeeService.updateEmployee(employee);
                utx.commit();
            }
            request.setAttribute("action", "edited");
            request.getRequestDispatcher(PROFILECONFIRMATIONPAGE).forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("errorTitle", "Error!");
            request.setAttribute("errorTitle", ex.getMessage());
            request.getRequestDispatcher(ERRORPAGE).forward(request, response);
        }
    }
}
