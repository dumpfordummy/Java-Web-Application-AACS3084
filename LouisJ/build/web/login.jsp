<%-- 
    Document   : login
    Created on : Mar 10, 2023, 10:35:13 AM
    Author     : CY
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div>
            <form method="POST" action="login">
                <label for="uname">Username : </label><br>
                <input type="text" id="uname" name="uname"><br>
                <label for="upass">Password : </label><br>
                <input type="password" id="upass" name="upass"><br>
                <input type="submit">
            </form>
        </div>
    </body>
</html>