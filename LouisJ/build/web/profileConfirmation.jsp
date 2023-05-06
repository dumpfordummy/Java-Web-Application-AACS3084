<%-- 
    Document   : profileDelete
    Created on : May 4, 2023, 4:35:35 PM
    Author     : CY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete user</title>
    </head>
    <body>
        <h2>User <%= request.getAttribute("action") %> successfully, click <a href="/home">me</a> to back to home</h2>
    </body>
</html>
