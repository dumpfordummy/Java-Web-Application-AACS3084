package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import javax.servlet.http.*;
import javax.servlet.*;
import java.security.MessageDigest;  
import utils.hashUtil;

/**
 *
 * @author CY
 */
public class LoginController extends HttpServlet {
    
    private static final String LOGINPG = "/login.jsp";
    
    public LoginController() {
    } 
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher(LOGINPG).forward(req, res);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        String username = req.getParameter("uname");
        String password = req.getParameter("upass");
        String id = UUID.randomUUID().toString();
        String passwordHash = hashUtil.getHashed(password, id);
        
        res.setContentType("text/html");
        
        PrintWriter out = res.getWriter();
        out.print("<h1>Username: " + username + "</h1>");
        out.print("<h1>Password: " + password + "</h1>");
        out.print("<h1>Password Hash: " + passwordHash + "</h1>");
    }
    
}


