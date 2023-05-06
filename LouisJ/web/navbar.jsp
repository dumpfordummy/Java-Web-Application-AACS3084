<%-- 
    Document   : navbar
    Created on : Apr 25, 2023, 9:15:01 AM
    Author     : Pua
--%>

<%@page import="interfaces.User"%>
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
                <img src="images/logo.png" height="50" width="150" class="d-inline-block align-top" alt="LOGO.PNG">
            </a>
            <div class="navbar-nav ml-auto">
                <div class="dropdown">
                    <a class="nav-item nav-link" href="#">
                        <img src="images/account.png" height="30" class="d-inline-block align-top" alt="ACCOUNT.PNG">
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
                        <a href="loginStaff.jsp">Login Staff</a>
                        <a href="login.jsp">Login Customer</a>
                        <a href="register.jsp">Register Customer</a>
                        <%} else {%>
                        <a href="profile.jsp">Profile</a>
                        <% } %>
                    </div>
                </div>
                <a class="nav-item nav-link" href="cartPayment">
                    <img src="images/cart.png" height="30" class="d-inline-block align-top" alt="CART.PNG">
                    <span class="ml-2">CART</span>
                </a>
            </div>
        </nav>  
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="home" >Home</a>
            <a href="product" >Products</a>
            <a href="voucher" >Vouchers</a>
            <%
                if (users
                        != null) {
                    if (users.getUsertype().equals(User.MANAGER) || users.getUsertype().equals(User.STAFF)) { %>
            <a href="addProduct.jsp">Add Product</a>
            <a href="customerList">Customer List</a>
            <a href="staffList">Staff List</a>
            <a href="orderList">Order List</a>
            <a href="salesReport">Sales Report</a>
            <a href="addVoucher.jsp">Add Voucher</a>
            <%  }
                }%>
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
