<%-- 
    Document   : Error
    Created on : Apr 27, 2023, 1:13:28 AM
    Author     : CY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! String errorTitle; %>
        <%! String errorMessage; %>
        <% errorTitle = (String)request.getAttribute("errorTitle"); %>
        <% errorMessage = (String)request.getAttribute("errorMessage"); %>
        <h1><%= errorTitle == null ? "Error" : errorTitle %></h1>
        <p><%= errorMessage == null ? "An Unexpected Error occurred. Please contact administration for further assistance" : errorMessage %></p>
        <a href="/home">back home</a>
    </body>
</html>
