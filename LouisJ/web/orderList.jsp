<%-- 
    Document   : orderList
    Created on : Apr 17, 2023, 11:05:29 PM
    Author     : Wai Loc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Louis J - Order List</title>
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
    </head>
    <body>
        <div class="headercontainer-headercontainer">
            <img src="/image/logo.png" alt="LOUIS J" class="headercontainer-logo" />
            <div class="headercontainer-header-outer-wrapper">
                <div class="headercontainer-header-account-wrapper">
                    <img src="/image/account.png" alt="ACCOUNT ICON" class="headercontainer-account-icon" />
                    <span>Account</span>
                </div>
                <div class="headercontainer-header-cart-wrapper">
                    <img src="/image/cart.png" alt="CART ICON" class="headercontainer-cart-icon" />
                    <span>Cart</span>
                </div>
            </div>
            <img src="/image/menu.png" alt="MENU ICON" class="headercontainer-menu-icon" />
            <div class="headercontainer-search-bar">
                <input type="text" id="searchInput" name="searchInput" class="headercontainer-search-input" placeholder="Search...">
            </div>
        </div>

        <div class="orderBox">
            <div class="orderDetails">
                Order number: XXXXXX<br />
                Date: dd/MM/YYYY<br />
                <br />
                Items:<br />
                1.<br />
                2.<br />
                3.<br /><br />
                Subtotal: RM XXX<br />
            </div>
            <div class="orderStatus">
                <p>
                    <span>STATUS: </span>
                    <span>DELIVERED</span><span>/ </span><span>PENDING</span>
                </p>
            </div>
        </div>
    </body>
</html>
