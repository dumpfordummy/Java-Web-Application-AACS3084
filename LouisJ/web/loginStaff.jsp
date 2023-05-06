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
        <script src="https://kit.fontawesome.com/2592c49560.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="styling/login.css"/>
    </head>
    <body>
        <div class="overlay">
            <form method="POST" action="loginStaff">
                <!--   con = Container  for items in the form-->
                <div class="con">
                    <!--     Start  header Content  -->
                    <header class="head-form">
                        <h2>Staff Log In</h2>
                        <!--     A welcome message or an explanation of the login form -->
                        <p>login here using your staff username and password</p>
                    </header>
                    <!--     End  header Content  -->
                    <br>
                    <div class="field-set">

                        <!--   user name -->
                        <span class="input-item">
                            <i class="fa fa-user-circle"></i>
                        </span>
                        <!--   user name Input-->
                        <input class="form-input" id="txt-input" name="uname" type="text" placeholder="UserName" required>

                        <br>

                        <!--   Password -->

                        <span class="input-item">
                            <i class="fa fa-key"></i>
                        </span>
                        <!--   Password Input-->
                        <input class="form-input" type="password" placeholder="Password" id="pwd"  name="upass" required>

                        <!--      Show/hide password  -->
                        <span>
                            <i class="fa fa-eye" aria-hidden="true"  type="button" id="eye"></i>
                        </span>


                        <br>
                        <!--        buttons -->
                        <!--      button LogIn -->
                        <button class="log-in"> Log In </button>
                    </div>

                    <%
                        String loginErrorMsg = (String) request.getAttribute("loginErrorMsg");
                        if (loginErrorMsg != null) {

                    %>
                    <p style="color:red"><%= loginErrorMsg%></p> <br>
                    <%
                        }
                    %>

                    <!--   other buttons -->
                    <div class="other">
                        <!--      Forgot Password button-->
                        <button class="btn submits frgt-pass" onclick="location.pathname = 'forgotStaff'">Forgot Password</button>
                        <!--         Sign Up font icon -->
                        <button class="btn submits sign-up" onclick="location.pathname = 'register'" style="visibility:hidden">Sign Up 
                            <i class="fa fa-user-plus" aria-hidden="true"></i>
                        </button>
                        <!--      End Other the Division -->
                    </div>

                    <!--   End Conrainer  -->
                </div>

                <!-- End Form -->
            </form>
        </div>

        <script>
            function show() {
                var p = document.getElementById('pwd');
                p.setAttribute('type', 'text');
            }

            function hide() {
                var p = document.getElementById('pwd');
                p.setAttribute('type', 'password');
            }

            var pwShown = 0;

            document.getElementById("eye").addEventListener("click", function () {
                if (pwShown == 0) {
                    pwShown = 1;
                    show();
                } else {
                    pwShown = 0;
                    hide();
                }
            }, false);

        </script>

        <!--        <div class="login-container">
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
                </div>-->
    </body>
</html>