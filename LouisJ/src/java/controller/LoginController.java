package controller;

import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.transaction.UserTransaction;
import model.Customer;
import model.CustomerService;
import util.UserSessionUtil;
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

    private static final String LOGINPAGE = "/login.jsp";
    private static final String HOMEPAGE = "/home";

    public LoginController() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(LOGINPAGE).forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("upass");
        CustomerService customerService = new CustomerService(em);

        Customer customer = customerService.findCustomerByUsername(username);
        UserSessionUtil userSession = new UserSessionUtil(request.getSession());

        if (customer != null) {
            String id = customer.getId();
            String passwordHash = hashUtil.getHashed(password, id);
            if (username.equals(customer.getUsername()) && passwordHash.equals(customer.getPasswordhash())) {
                Cookie userCookie = userSession.setUserSession(customer);
                response.addCookie(userCookie);
                response.sendRedirect(HOMEPAGE);
            }
        }
    }

}
