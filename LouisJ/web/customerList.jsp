<%-- 
    Document   : customerList
    Created on : Apr 17, 2023, 11:05:29 PM
    Author     : Wai Loc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.Customer" %>
<jsp:useBean id="sessionUtil" class="util.UserSessionUtil" />
<jsp:useBean id="user" class="interfaces.User" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Louis J - Customer List</title>
        <%@include file="navbar.jsp" %> 
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <% if (sessionUtil.getCurrentLoginUser(request.getCookies()).equals("manager")){ %>
            <a class="btn btn-primary" href="" style="width: 120px; margin: 2rem 2rem 0 2rem">Add Customer</a>
        <% } %>
        
        <div class="row">
            <% 
                List<Customer> customerList = (List<Customer>)request.getAttribute("customerList"); 
            %>
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column m-3">
                <div class="card bg-light d-flex flex-fill">
                    <div class="card-header border-bottom-0 p-3">
                        <h2 class="lead"><b>CustomerName</b></h2>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-7">
                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-phone" style="font-size: 15px; color: gray; padding-right: 5px;"></i></span> CustomerContactNo</li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-envelope" style="font-size: 15px; color: gray; padding-right: 5px;"></i></span> CustomerEmail</li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-address-book-o" style="font-size: 20px; color: gray; padding-right: 5px;"></i></span> CustomerAddress</li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa-solid fa-calendar-days" style="font-size: 20px; color: gray; padding-right: 5px;"></i></span> Joined 1 January 1999</li>
                                </ul>
                            </div>
                            <div class="col-5 text-center">
                                <img src="@staff.ProfilePicPath" alt="user-avatar" class="img-circle img-fluid" style="max-width: 120px; max-height: 120px;">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer p-3">
                        <% if (sessionUtil.getCurrentLoginUser(request.getCookies()).equals("manager")){ %>
                            <a href="" style="text-decoration: none;">
                                <i class="fa-regular fa-pen-to-square fa-2xl"></i>
                            </a>
                            <a id="deleteItem" style="cursor: pointer;" class="deleteItem" data-target="#basic" data-toggle="modal">
                                <i class="fa fa-trash fa-2xl"></i>
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
