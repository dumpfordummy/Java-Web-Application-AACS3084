<%-- 
    Document   : profileEdit
    Created on : Apr 29, 2023, 12:23:18 AM
    Author     : CY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Employee"%>
<%@page import="util.UserSessionUtil"%>
<%@page import="interfaces.User"%>
<%@page import="model.Customer"%>
<%@page import="model.CustomerService"%>

<%! UserSessionUtil userSession;%>             
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="/components/common_css_js.jsp" %>
        <link rel="stylesheet" href="/styling/profile.css"/>
        <style>
            body{
                background-color: #E8D4B2;
            }

            .navbar,.emp-profile{
                background-color: #FFECD4;

            }

            .footer{
                width:100%;
                background-color: #FFECD4;
                a:link{
                    text-decoration: none;
                }
            }

            .copyright{
                text-align: center;
            }

            .footerLink{
                color: #2B231C;

                &:hover{
                    color:gray;
                    text-decoration: underline;
                }
            }

            a{
                text-decoration: none;
            }

            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

            .sidenav a:hover {
                color: #f1f1f1;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            #main {
                transition: margin-left .5s;
                padding: 16px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }
                .sidenav a {
                    font-size: 18px;
                }
            }

            .dropbtn {
                background-color: #04AA6D;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 165px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                border-bottom: 1px solid lightgray;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #3e8e41;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md">
            <div class="navbar-brand">
                <div class="d-flex align-items-center">
                    <div id="main">
                        <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
                    </div>

                    <form class="form-inline" method="get" action="search" id="searchBar">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search Product" aria-label="Search" name="searchTerm">
                    </form>
                </div>
            </div>
            <a class="navbar-brand mx-auto">
                <img src="/images/logo.png" height="50" width="150" class="d-inline-block align-top" alt="LOGO.PNG">
            </a>
            <div class="navbar-nav ml-auto">
                <div class="dropdown">
                    <a class="nav-item nav-link" href="#">
                        <img src="/images/account.png" height="30" class="d-inline-block align-top" alt="ACCOUNT.PNG">
                        <span class="ml-2">ACCOUNT</span>
                    </a>
                    <div class="dropdown-content">
                        <%
                            util.UserSessionUtil userSession = new util.UserSessionUtil(request.getSession());
                            //Customer customer = new Customer("1001", "test", "056823974923", "test@cust.com", "", "Test Customer", "0137416287", "123, Jln Bunga, 50300 KL");
                            //Cookie userCookie = userSession.setUserSession(customer);
                            //response.addCookie(userCookie);
                            User users = userSession.getCurrentLoginUser(request.getCookies());
                            if (users == null) {
                        %>
                        <a href="/loginStaff.jsp">Login Staff</a>
                        <a href="/login.jsp">Login Customer</a>
                        <a href="/register.jsp">Register Customer</a>
                        <%} else {%>
                        <a href="/profile.jsp">Profile</a>
                        <% } %>
                    </div>
                </div>
                <a class="nav-item nav-link" href="cartPayment">
                    <img src="/images/cart.png" height="30" class="d-inline-block align-top" alt="CART.PNG">
                    <span class="ml-2">CART</span>
                </a>
            </div>
        </nav>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="/home" >Home</a>
            <a href="/product" >Products</a>
            <a href="/voucher" >Vouchers</a>
            <%
                if (users
                        != null) {
                    if (users.getUsertype().equals(User.MANAGER) || users.getUsertype().equals(User.STAFF)) { %>
            <a href="/customerList" target="_blank">Customer List</a>
            <a href="/staffList" target="_blank">Staff List</a>
            <a href="/orderList" target="_blank">Order List</a>
            <a href="/salesReport" target="_blank">Sales Report</a>
            <a href="/addVoucher.jsp" target="_blank">Add Voucher</a>
            <%  }
                }%>
        </div>
        <!--        NAVBAR ENDS HERE-->

        <%
            User currentUser = (User) request.getAttribute("user");
            if (currentUser == null) {
                userSession = new UserSessionUtil(request.getSession());
                currentUser = userSession.getCurrentLoginUser(request.getCookies());
            }
        %>

        <div class="container emp-profile">
            <form action="/profile/edit/<%= currentUser.getUsertype()%>/<%= currentUser.getId()%>" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="/image/<%= currentUser.getUsertype()%>/<%= currentUser.getId()%>"/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                            <h5>
                                <%= currentUser.getUsername()%>
                            </h5>
                            <h6>
                                <%= currentUser.getUsertype()%>
                            </h6>
                            <br>
                            <br>
                            <br>
                            <br>
                            <hr>
                        </div>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">

                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>User Id</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="userid" name="userid" value="<%= currentUser.getId()%>" disabled>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="username">Username</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="username" name="username" value="<%= currentUser.getUsername()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="fullname">Fullname</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="fullname" name="fullname" value="<%= currentUser.getFullname()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="email">Email</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="email" name="email" value="<%= currentUser.getEmail()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="contact">Contact</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="contact" name="contact" value="<%= currentUser.getContact()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="address">Address</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" id="address" name="address" value="<%= currentUser.getAddress()%>">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="profileImg">Profile Image</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="file" name="profileImg">
                                    </div>
                                </div>    

                                <input type="submit" value="Confirm">    
                            </div>
                        </div>
                    </div>
                </div>
            </form>           
        </div>
        <%@include file="footer.jsp" %>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";

            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";

            }
            // get the search form and input elements
            const form = document.getElementById('searchBar');
            const input = form.querySelector('input');

            // listen for keypress events on the input element
            input.addEventListener('keypress', function (e) {
                if (e.key === 'Enter') {
                    // if Enter key is pressed, prevent the default form submission
                    e.preventDefault();
                    // submit the form using JavaScript
                    form.submit();
                }
            });
        </script>
    </body>
</html>
