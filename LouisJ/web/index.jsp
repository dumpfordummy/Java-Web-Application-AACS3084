<%-- 
    Document   : index.jsp
    Created on : Mar 10, 2023, 11:35:27 AM
    Author     : CY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Louis J - Home</title>
        <link rel="stylesheet" type="text/css" href="styling/index.css">
    </head>

    <body>
        <div class="headercontainer-headercontainer">
            <img
                src="image/logo.png"
                alt="LOUIS J"
                class="headercontainer-logo"
                />
            <div class="headercontainer-header-outer-wrapper">
                <div class="headercontainer-header-account-wrapper">
                    <img
                        src="image/account.png"
                        alt="ACCOUNT ICON"
                        class="headercontainer-account-icon"
                        />
                    <span>Account</span>
                </div>
                <div class="headercontainer-header-cart-wrapper">
                    <img
                        src="image/cart.png"
                        alt="CART ICON"
                        class="headercontainer-cart-icon"
                        />
                    <span>Cart</span>
                </div>
            </div>
            <img
                src="image/menu.png"
                alt="MENU ICON"
                class="headercontainer-menu-icon"
                />
            <div class="headercontainer-search-bar">
                <input type="text" id="searchInput" name="searchInput" class="headercontainer-search-input" placeholder="Search...">
            </div>
        </div>

        <div class="homecontent-title-div">
            <span>Our cave of wonders</span>
        </div>

        <div class="homecontent-item-container">
            <a href="https://chat.openai.com/chat">
                <div class="homecontent-box">
                    <img src="image/backpack_home.png" alt="BACKPACK IMAGE">
                    <span>BACKPACK</span>
                </div>
            </a>

            <a href="https://chat.openai.com/chat">
                <div class="homecontent-box">
                    <img src="image/belt_bag_home.png" alt="BELT BAG IMAGE">
                    <span>BELT BAG</span>
                </div>
            </a>

            <a href="https://chat.openai.com/chat">
                <div class="homecontent-box">
                    <img src="image/clutch_bag_home.png" alt="CLUTCH BAG IMAGE">
                    <span>CLUTCH BAG</span>
                </div>
            </a>
        </div>
    </body>
</html>
