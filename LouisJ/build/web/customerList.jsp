<%-- 
    Document   : customerList
    Created on : Apr 17, 2023, 11:05:29 PM
    Author     : Wai Loc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="interfaces.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.Customer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= getServletContext().getInitParameter("companyName") %> - Customer List</title> 
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
    </head>
    <body>
        <%
            String userRole = (String) request.getAttribute("UserRole");
            if (userRole != null){
                if (userRole.equals(User.MANAGER) || userRole.equals(User.STAFF)){ %>
                    <a class="btn btn-primary" href="/register" style="width: 160px; margin: 2rem 2rem 0 2rem">Add Customer</a>
                <%  }} %>
        
        <div class="row" style="margin-bottom: 2rem;">
            <% 
                List<Customer> customerList = (List<Customer>)request.getAttribute("customerList");
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
                for (Customer c : customerList ){
            %>
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column m-3">
                <div class="card bg-light d-flex flex-fill">
                    <div class="card-header border-bottom-0 p-3">
                        <h2 class="lead"><b><%= c.getUsername()%></b></h2>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-7">
                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-phone" style="font-size: 15px; color: gray; padding-right: 5px;"></i></span> <%= c.getContact()%></li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-envelope" style="font-size: 15px; color: gray; padding-right: 5px;"></i></span> <%= c.getEmail()%></li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-address-book-o" style="font-size: 20px; color: gray; padding-right: 5px;"></i></span> <%= c.getAddress()%></li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa-solid fa-calendar-days" style="font-size: 20px; color: gray; padding-right: 5px;"></i></span> Joined <%= dateFormat.format(c.getDatejoin()) %></li>
                                </ul>
                            </div>
                            <div class="col-5 text-center">
                                <img src="/image/<%= c.getUsertype()%>/<%= c.getId()%>" alt="user-avatar" class="img-circle img-fluid" style="max-width: 120px; max-height: 120px;">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer p-3">
                        <%  if (userRole != null){
                                if (userRole.equals(User.MANAGER)){  %>
                                    <a href="/profile/edit/<%= c.getUsertype() %>/<%= c.getId() %>" style="text-decoration: none;">
                                        <i class="fa-regular fa-pen-to-square fa-2xl"></i>
                                    </a>
                                    <a href="/profile/delete/<%= c.getUsertype() %>/<%= c.getId() %>" class="deleteItem" style="text-decoration: none;">
                                        <i class="fa fa-trash fa-2xl"></i>
                                    </a>
                        <%  }
                                else{ %>
                                <a href="/profile/edit/<%= c.getUsertype() %>/<%= c.getId() %>" style="text-decoration: none;">
                                    <i class="fa-regular fa-pen-to-square fa-2xl"></i>
                                </a>
                        <% }} %>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
