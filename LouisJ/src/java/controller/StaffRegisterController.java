/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.transaction.UserTransaction;
import model.Employee;
import model.EmployeeService;
import util.hashUtil;

/**
 *
 * @author CY
 */
@MultipartConfig
@WebServlet(urlPatterns = "/registerStaff")
public class StaffRegisterController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    private static final String STAFFREGISTERPAGE = "/registerStaff.jsp";
    private static final String HOMEPAGE = "/home";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(STAFFREGISTERPAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

        EmployeeService employeeService = new EmployeeService(em);
        Employee employee = employeeService.findEmployeeByUsername(username);

        if (employee == null) {
            try {
                employee = new Employee();
                String id = UUID.randomUUID().toString();
                System.out.println("password: " + password + " , id: " + id);
                String passwordHash = hashUtil.getHashed(password, id);
                employee.setId(id);
                employee.setUsername(username);
                employee.setPasswordhash(passwordHash);
                employee.setFullname(name);
                employee.setEmail(email);
                employee.setContact(contact);
                employee.setAddress(address);
                employee.setUsertype(User.STAFF);

                Part imagePart = request.getPart("profileImg");

                if (imagePart != null) {
                    try (
                            InputStream imageContent = imagePart.getInputStream()) {
                        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                        int nRead;
                        byte[] data = new byte[1024];
                        while ((nRead = imageContent.read(data, 0, data.length)) != -1) {
                            buffer.write(data, 0, nRead);
                        }
                        buffer.flush();
                        byte[] imageBytes = buffer.toByteArray();
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        employee.setProfileimg(base64Image);
                        employee.setProfileimgtype(imagePart.getContentType());
                    }
                }

                utx.begin();
                boolean isRegisterSuccess = employeeService.addEmployee(employee);
                utx.commit();
            } catch (Exception ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        response.sendRedirect("/staffList");
    }
}
