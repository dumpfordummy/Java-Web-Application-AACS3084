<%-- 
    Document   : navbar
    Created on : Apr 25, 2023, 9:15:01 AM
    Author     : Pua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Louis J - Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <nav class="navbar navbar-expand-md">
            <a class="navbar-brand" href="#">
                <div class="d-flex align-items-center">
                    <div id="main">
                        <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
                    </div>

                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
                    </form>
                </div>
            </a>
            <a class="navbar-brand mx-auto">
                <img src="image/logo.png" height="50" width="150" class="d-inline-block align-top" alt="LOGO.PNG">
            </a>
            <div class="navbar-nav ml-auto">
                <a class="nav-item nav-link" href="#">
                    <img src="image/account.png" height="30" class="d-inline-block align-top" alt="ACCOUNT.PNG">
                    <span class="ml-2">ACCOUNT</span>
                </a>
                <a class="nav-item nav-link" href="#">
                    <img src="image/cart.png" height="30" class="d-inline-block align-top" alt="CART.PNG">
                    <span class="ml-2">CART</span>
                </a>
            </div>
        </nav>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="#" target="_blank">Home</a>
            <a href="#" target="_blank">Products</a>
            <a href="addProduct.jsp" target="_blank">Add Product</a>
        </div>
        
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
                
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";
                
            }
        </script>
    </body>
</html>
