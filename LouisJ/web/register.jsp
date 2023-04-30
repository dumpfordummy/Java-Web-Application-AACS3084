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
                <form method="POST" action="register" id="registerForm" enctype="multipart/form-data">
                    <label for="profileImg">profileImg</label><br>
                    <input type="file" name="profileImg" accept="image/*"><br>

                    <label for="username">Username</label><br>
                    <input type="text" id="username" name="username"><br>

                    <label for="password">Password</label><br>
                    <input type="password" id="password" name="password"><br>
                    
                    <label for="name">Name</label><br>
                    <input type="text" id="name" name="name"><br>

                    <label for="email">email</label><br>
                    <input type="text" id="email" name="email"><br>

                    <label for="contact">contact</label><br>
                    <input type="text" id="contact" name="contact"><br>

                    <label for="address">address</label><br>
                    <input type="text" id="address" name="address"><br>

                    <input type="submit" value="Register">
                </form>
            </div> 
        </div>
    </body>
</html>