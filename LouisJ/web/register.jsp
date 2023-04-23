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
        <link rel="stylesheet" href="styling/login.css"/>
    </head>
    <body>
        <div class="register-container">
            <div class="register-title">
                <h1>REGISTER</h1>
            </div>
            <div class="register-form">
                <form method="POST" action="register" id="registerForm">
                    <label for="uname">Username</label><br>
                    <input type="text" id="uname" name="uname"><br>
                    <label for="upass">Password</label><br>
                    <input type="password" id="upass" name="upass"><br>
                    <input type="submit" value="Register">
                </form>
            </div> 
        </div>
    </body>
</html>