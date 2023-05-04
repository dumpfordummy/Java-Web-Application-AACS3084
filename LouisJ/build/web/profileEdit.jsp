<%-- 
    Document   : profileEdit
    Created on : Apr 29, 2023, 12:23:18 AM
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
        <title>Edit Profile</title>
    </head>
    <body>
        <%
            User user = (User) request.getAttribute("user");
            if (user == null) {
                userSession = new UserSessionUtil(request.getSession());
                user = userSession.getCurrentLoginUser(request.getCookies());
            }
        %>
        <form action="/profile/edit/<%= user.getUsertype() %>/<%= user.getId() %>" method="post" enctype="multipart/form-data">
            <img src="/image/<%= user.getUsertype()%>/<%= user.getId()%>"/> <br>
            <label for="profileImg">profileImg</label><br>
            <input type="file" name="profileImg"><br>

            <label for="username">Username</label><br>
            <input type="text" id="username" name="username" value="<%= user.getUsername()%>"><br>

            <label for="name">Full Name</label><br>
            <input type="text" id="fullname" name="fullname" value="<%= user.getFullname()%>"><br>

            <label for="email">email</label><br>
            <input type="text" id="email" name="email" value="<%= user.getEmail()%>"><br>

            <label for="contact">contact</label><br>
            <input type="text" id="contact" name="contact" value="<%= user.getContact()%>"><br>

            <label for="address">address</label><br>
            <input type="text" id="address" name="address" value="<%= user.getAddress()%>"><br>

            <input type="submit" value="Confirm">
        </form>
    </body>
</html>
