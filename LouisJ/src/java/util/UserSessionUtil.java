/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import javax.servlet.http.*;
import model.Customer;

/**
 *
 * @author CY
 */
public class UserSessionUtil {
    
    private HttpSession session;
    private final String SESSION_ID = "sessionId";

    public UserSessionUtil(HttpSession session) {
        this.session = session;
    }
    
    // need to set this cookie returned to user's cookie
    public Cookie setSessionCustomer(Customer customer) {
        String sessionId = session.getId();
        session.setAttribute(sessionId, customer);
        return new Cookie(SESSION_ID,sessionId);
    }
    
    public Customer getSessionCustomer(Cookie[] userCookies) {
        for(Cookie cookie : userCookies) {
            if(cookie.getName().equals(SESSION_ID)) {
                return (Customer)session.getAttribute(cookie.getValue());
            }
        }
        //Whenever user logged in, session and cookie will be set, null indicates that it is not logged in.
        return null;
    }
    
}
