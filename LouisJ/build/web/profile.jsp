<%-- 
    Document   : profile
    Created on : Apr 25, 2023, 4:59:20 PM
    Author     : CY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Employee"%>
<%@page import="util.UserSessionUtil"%>
<%@page import="interfaces.User"%>
<%@page import="model.Customer"%>
<%@page import="model.CustomerService"%>

<%! UserSessionUtil userSession;%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%
            userSession = new UserSessionUtil(request.getSession());
            User user = userSession.getCurrentLoginUser(request.getCookies());

        %>
        
        <h2>Username: <%= user.getUsername()%> </h2> <br/>
        <h2>Role: <%= user.getUsertype()%> </h2> <br/>
        <h2>Date Joined: N/A     </h2> <br/>
        <a href="/profile/edit">Edit</a>


    </body>
</html>
