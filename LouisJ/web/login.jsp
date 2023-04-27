<%-- 
    Document   : login
    Created on : Mar 10, 2023, 10:35:13 AM
    Author     : CY
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="styling/login.css"/>
    </head>
    <body>
        <!--        <div class="login-form">
                    <form action="/examples/actions/confirmation.php" method="post">
                        <h2 class="text-center">Sign in</h2>		
                        <div class="text-center social-btn">
                            <a href="#" class="btn btn-danger btn-block"><i class="fa fa-google"></i> Sign in with <b>Google</b></a>
                        </div>
                        <div class="or-seperator"><i>or</i></div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="username" placeholder="Username" required="required">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                            </div>
                        </div>        
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-block login-btn">Sign in</button>
                        </div>
                        <div class="clearfix">
                            <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
                            <a href="#" class="pull-right text-success">Forgot Password?</a>
                        </div>  
        
                    </form>
                    <div class="hint-text small">Don't have an account? <a href="#" class="text-success">Register Now!</a></div>
                </div>-->

        <div class="login-container">
            <div class="login-title">
                <h1>LOGIN</h1>
            </div>
            <div class="login-form">
                <form method="POST" action="login" id="loginForm">
                    <label for="uname">Username</label><br>
                    <input type="text" id="uname" name="uname"><br>
                    <label for="upass">Password</label><br>
                    <input type="password" id="upass" name="upass"><br>
                    <input type="submit" value="Login">
                </form>
            </div> 
        </div>
    </body>
</html>