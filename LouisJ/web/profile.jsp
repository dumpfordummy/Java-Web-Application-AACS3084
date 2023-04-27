<%-- 
    Document   : profile
    Created on : Apr 25, 2023, 4:59:20 PM
    Author     : CY
--%>

<%@page import="model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="util.UserSessionUtil"%>
<%@page import="interfaces.UserRole"%>
<%@page import="model.Customer"%>
<%@page import="model.CustomerService"%>

<%! UserRole user;    %>
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
            UserRole user = userSession.getUserSession(request.getCookies());
            if (user != null) {
                if (user.getUserRole() == UserRole.CUSTOMER) {
                    user = (Customer) user;
                } else {
                    user = (Employee) user;
                }
            }

        %>
        <% if (request.getRequestURI().contains("edit")) { %>
        <form>
            <input type="hidden" name="id" value=""/>
            <input type="text" id="name" name="name"><br>
            <input type="text" id="email" name="email"><br>
            <input type="text" id="contact" name="contact"><br>
            <input type="text" id="address" name="address"><br>
            <input type="text" id="age" name="age"><br>
            <input type="submit" value="Confirm">
        </form>

        <% } else {%>

        <form>
            <input type="text" id="name" name="name" readonly><br>
            <input type="text" id="email" name="email" readonly><br>
            <input type="text" id="contact" name="contact" readonly><br>
            <input type="text" id="address" name="address" readonly><br>
            <input type="text" id="age" name="age" readonly><br>
        </form>
        <button onclick="location.href += '/edit'">Edit</button>
        <% }%>
        <h2>Username: <%= user.getUsername() %> </h2> <br/>
        <h2>Role: <%= user.getUserRole()%> </h2> <br/>
        <h2>Date Joined: N/A </h2> <br/>

    </body>
</html>
