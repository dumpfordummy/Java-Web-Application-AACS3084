package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import javax.servlet.http.*;
import javax.servlet.*;
import java.security.MessageDigest;

import dao.CustomerDao;

/**
 *
 * @author CY
 */
public class LoginController extends HttpServlet {

    private static final String LOGINPG = "/login.jsp";
    
    public CustomerDao dao;
    
    public LoginController() {
        dao = new CustomerDao();
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
        String passwordHash = bytesToHex(sha256(password.getBytes(), id.getBytes()));
        
        res.setContentType("text/html");
        
        PrintWriter out = res.getWriter();
        out.print("<h1>Username: " + username + "</h1>");
        out.print("<h1>Password: " + password + "</h1>");
        out.print("<h1>Password Hash: " + passwordHash + "</h1>");
    }
    
    private static byte[] sha256(byte[] input, byte[] salt) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] saltedInput = concatenateByteArrays(input, salt);
            return digest.digest(saltedInput);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
    private static byte[] concatenateByteArrays(byte[] a, byte[] b) {
        byte[] result = new byte[a.length + b.length];
        System.arraycopy(a, 0, result, 0, a.length);
        System.arraycopy(b, 0, result, a.length, b.length);
        return result;
    
}
    
    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}


