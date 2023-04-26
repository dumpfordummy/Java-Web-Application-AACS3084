<%-- 
    Document   : staffList
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
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

       <div class="row">
            <div class="col-5 p-3 m-3">
                <div class="card-header border-bottom-0 mt-2 p-3">
                    <h2 class="lead"><b>StaffName</b></h2>
                </div>
                <div class="card-body pt-0">
                    <div class="row">
                        <div class="col-7">
                            <ul class="ml-4 mb-0 fa-ul text-muted">
                                <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-phone" style="font-size: 15px; color: gray; padding-right: 5px;"></i></span> StaffContactNo</li>
                                <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-envelope" style="font-size: 15px; color: gray; padding-right: 5px;"></i></span> StaffEmail</li>
                            </ul>
                        </div>
                        <div class="col-5 text-center">
                            <img src="@staff.ProfilePicPath" alt="user-avatar" class="img-circle img-fluid" style="max-width: 120px; max-height: 120px;">
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="">
                        <i class="fa fa-pencil-square-o fa-xl" aria-hidden="true"></i>
                    </a>
                    <a href="" class="btn btn-sm btn-primary">
                        <i class="fas fa-user fa-sm"></i>
                    </a>
                    <a id="deleteItem" style="cursor: pointer;" class="deleteItem" data-target="#basic" data-toggle="modal">
                        <i class="fa fa-trash fa-xl"></i>
                    </a>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
