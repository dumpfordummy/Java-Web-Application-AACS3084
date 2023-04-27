/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import interfaces.UserRole;
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
    public Cookie setUserSession(UserRole user) {
        String sessionId = session.getId();
        session.setAttribute(sessionId, user);
        return new Cookie(SESSION_ID,sessionId);
    }
    
    public UserRole getUserSession(Cookie[] userCookies) {
        for(Cookie cookie : userCookies) {
            if(cookie.getName().equals(SESSION_ID)) {
                return (UserRole)session.getAttribute(cookie.getValue());
            }
        }
        //Whenever user logged in, session and cookie will be set, null indicates that it is not logged in.
        return null;
    }
    
}
