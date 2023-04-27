<%-- 
    Document   : profile
    Created on : Apr 25, 2023, 4:59:20 PM
    Author     : CY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer"%>
<%@page import="model.CustomerService"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! boolean isEditState = false;%>
        <% if (isEditState) { %>
        <form>
            <input type="text" id="name" name="name"><br>
            <input type="text" id="email" name="email"><br>
            <input type="text" id="contact" name="contact"><br>
            <input type="text" id="address" name="address"><br>
            <input type="text" id="age" name="age"><br>
            <input type="submit" value="Confirm">
        </form>
        <% } else {%>
        
        <form action="edit">
            <input type="text" id="name" name="name" readonly><br>
            <input type="text" id="email" name="email" readonly><br>
            <input type="text" id="contact" name="contact" readonly><br>
            <input type="text" id="address" name="address" readonly><br>
            <input type="text" id="age" name="age" readonly><br>
            <input type="submit" value="Edit">
        </form>
        <% }%>
        <h2>Username: </h2> <br/>
        <h2>Role: </h2> <br/>
        <h2>Date Joined: </h2> <br/>

    </body>
</html>
