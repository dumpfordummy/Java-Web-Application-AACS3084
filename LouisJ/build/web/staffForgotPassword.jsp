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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" href="styling/login.css"/>
    </head>
    <body>
        <div class="overlay">
            <a href="/home"><img src="images/logo.png" alt="alt" style="display: block; margin-left: auto;margin-right: auto;width: 20%;margin-top:2%;"/></a>
            
            <form method="POST" action="forgotStaff">
                <!--   con = Container  for items in the form-->
                <div class="con">
                    <!--     Start  header Content  -->
                    <header class="head-form">
                        <h2>Staff Forgot password</h2>
                        <!--     A welcome message or an explanation of the login form -->
                        <p>Reset your staff password by staff username</p>
                    </header>
                    <!--     End  header Content  -->
                    <br>
                    <div class="field-set">

                        <!--   user name -->
                        <span class="input-item">
                            <i class="fa fa-user-circle"></i>
                        </span>
                        <!--   user name Input-->
                        <input class="form-input" id="txt-input" name="username" type="text" placeholder="UserName" required>

                        <br>

                        <!--   Password -->

                        <span class="input-item">
                            <i class="fa fa-key"></i>
                        </span>
                        <!--   Password Input-->
                        <input class="form-input" type="password" placeholder="Password" id="pwd"  name="password" required>

                        <!--      Show/hide password  -->
                        <span>
                            <i class="fa fa-eye" aria-hidden="true"  type="button" id="eyepw"></i>
                        </span>

                        <!--   Confirm Password -->
                        <br>
                        
                        <span class="input-item">
                            <i class="fa fa-key"></i>
                        </span>
                        <!--   Password Input-->
                        <input class="form-input" type="password" placeholder="ConfirmPassword" id="cpwd"  name="confirmPassword" required>

                        <!--      Show/hide confirm password  -->
                        <span>
                            <i class="fa fa-eye" aria-hidden="true"  type="button" id="eyecpw"></i>
                        </span>


                        <br>
                        <!--        buttons -->
                        <!--      button LogIn -->
                        <button class="log-in" id="resetBtn" > Reset </button>
                    </div>

                    <!--   End Conrainer  -->
                </div>

                <!-- End Form -->
            </form>
        </div>

        <script>
            $('#pwd, #cpwd').on('keyup', function () {
                if ($('#pwd').val() == $('#cpwd').val()) {
                    $("#resetBtn").prop("disabled", false);
                    $("#resetBtn").css("color", "#252537");
                } else {
                    $("#resetBtn").prop("disabled", true);
                    $("#resetBtn").css("color", "#ffcccb");
                }
            });

            function showpwd() {
                var p = document.getElementById('pwd');
                p.setAttribute('type', 'text');
            }

            function hidepwd() {
                var p = document.getElementById('pwd');
                p.setAttribute('type', 'password');
            }

            function showcpwd() {
                var cp = document.getElementById('cpwd');
                cp.setAttribute('type', 'text');
            }

            function hidecpwd() {
                var cp = document.getElementById('cpwd');
                cp.setAttribute('type', 'password');
            }

            var pwShown = 0;
            var cpwShown = 0;

            document.getElementById("eyepw").addEventListener("click", function () {
                if (pwShown == 0) {
                    pwShown = 1;
                    showpwd();
                } else {
                    pwShown = 0;
                    hidepwd();
                }
            }, false);

            document.getElementById("eyecpw").addEventListener("click", function () {
                if (cpwShown == 0) {
                    cpwShown = 1;
                    showcpwd();
                } else {
                    cpwShown = 0;
                    hidecpwd();
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