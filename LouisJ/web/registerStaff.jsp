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
        <title>Register</title>
        <script src="https://kit.fontawesome.com/2592c49560.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="styling/login.css"/>
    </head>
    <body>
        <div class="overlay">
            <form method="POST" action="registerStaff" enctype="multipart/form-data">
                <!--   con = Container  for items in the form-->
                <div class="con">
                    <!--     Start  header Content  -->
                    <header class="head-form">
                        <h2>Sign up</h2>
                        <!--     A welcome message or an explanation of the login form -->
                        <p>Register an account with your information</p>
                    </header>
                    <!--     End  header Content  -->
                    <br>
                    <div class="field-set">

                        <!--   user name -->
                        <span class="input-item">
                            <i class="fa fa-user-circle"></i>
                        </span>
                        <!--   user name Input-->
                        <input class="form-input" id="txt-input" name="username" type="text" placeholder="Username" required>

                        <br>
                        
                        <!--   Password -->

                        <span class="input-item">
                            <i class="fa fa-key"></i>
                        </span>
                        <!--   Password Input-->
                        <input class="form-input" type="password" name="password" placeholder="Password" id="pwd" required>

                        <!--      Show/hide password  -->
                        <span>
                            <i class="fa fa-eye" aria-hidden="true"  type="button" id="eye"></i>
                        </span>


                        <br>
                        
                        <span class="input-item">
                            <i class="fa fa-user-circle"></i>
                        </span>
                        <!--   user name Input-->
                        <input class="form-input" id="txt-input" name="name" type="text" placeholder="Fullname" required>

                        <br>

                        
                        <span class="input-item">
                            <i class="fa fa-user-circle"></i>
                        </span>
                        <!--   user name Input-->
                        <input class="form-input" id="txt-input" name="email" type="text" placeholder="Email" required>

                        <br>

                        
                        <span class="input-item">
                            <i class="fa fa-user-circle"></i>
                        </span>
                        <!--   user name Input-->
                        <input class="form-input" id="txt-input" name="contact" type="text" placeholder="Contact" required>

                        <br>
                        
                        
                        <span class="input-item">
                            <i class="fa fa-user-circle"></i>
                        </span>
                        <!--   user name Input-->
                        <input class="form-input" id="txt-input" name="address" type="text" placeholder="Address" required>

                        <br>
                        
                        
                        <label for="profileImg">profileImg</label><br>
                        <input type="file" name="profileImg" accept="image/*" required><br>
                        
                        <br>
                        
                        <!--        buttons -->
                        <!--      button LogIn -->
                        <button class="log-in"> Sign up </button>
                    </div>

                    <!--   other buttons -->
                    <div class="other">
                        <!--     Sign Up button -->
                        <button class="btn submits sign-up" onclick="location.pathname='loginStaff'" style="width:280px;margin:0;">Login
                            <!--         Sign Up font icon -->
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

        <!--        <div class="register-container">
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
                </div>-->
    </body>
</html>