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
public class LoginController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    private static final String LOGINPG = "/login.jsp";

    public LoginController() {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(LOGINPG).forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");

        PrintWriter out = res.getWriter();
        String username = req.getParameter("uname");
        String password = req.getParameter("upass");
        CustomerService customerService = new CustomerService(em);

        Customer customer = customerService.findCustomerByUsername(username);
        if (customer != null) {
            String id = customer.getId();
            String passwordHash = hashUtil.getHashed(password, id);
            System.out.println(id);
            System.out.println(passwordHash);
            System.out.println(customer.getPasswordhash());
            if (username.equals(customer.getUsername()) && passwordHash.equals(customer.getPasswordhash())) {
                out.print("Login Successful!");
                return;
            }
        }
        String uid=UUID.randomUUID().toString();
        out.print("Invalid Username or Password <br>");
        out.print("id=" + uid + "<br>");
        out.print("password hash:" + hashUtil.getHashed(password, uid));
    }

}
