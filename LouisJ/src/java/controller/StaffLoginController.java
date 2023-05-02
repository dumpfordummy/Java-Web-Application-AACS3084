/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Employee;
import model.EmployeeService;
import util.UserSessionUtil;
import util.hashUtil;

/**
 *
 * @author CY
 */
@WebServlet(urlPatterns = "/loginStaff")
public class StaffLoginController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    private static final String STAFFLOGINPAGE = "/loginStaff.jsp";
    private static final String HOMEPAGE = "/homePage.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(STAFFLOGINPAGE).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("upass");
        EmployeeService employeeService = new EmployeeService(em);

        
        Employee employee = employeeService.findEmployeeByUsername(username);
        UserSessionUtil userSession = new UserSessionUtil(request.getSession());

        if (employee != null) {
            String id = employee.getId();
            String passwordHash = hashUtil.getHashed(password, id);
            if (username.equals(employee.getUsername()) && passwordHash.equals(employee.getPasswordhash())) {
                Cookie userCookie = userSession.setUserSession(employee);
                response.addCookie(userCookie);
                response.sendRedirect(HOMEPAGE);
            }
        }
    }
}
