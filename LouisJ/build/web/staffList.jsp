<%-- 
    Document   : staffList
    Created on : Apr 17, 2023, 11:05:29 PM
    Author     : Wai Loc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="interfaces.*"%>
<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Louis J - Staff List</title>
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
                if (userRole.equals(User.MANAGER)){ %>
                    <a class="btn btn-primary" href="/registerStaff" style="width: 120px; margin: 2rem 2rem 0 2rem">Add Staff</a>
        <%  }} %>
        
        <div class="row" style="margin-bottom: 2rem;">
            <% 
                List<Employee> employeeList = (List<Employee>)request.getAttribute("employeeList");
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
                for (Employee e : employeeList) {
            %>
            <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column m-3">
                <div class="card bg-light d-flex flex-fill">
                    <div class="card-header border-bottom-0 p-3">
                        <h2 class="lead"><b><%= e.getUsername() %></b></h2>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-7">
                                <ul class="ml-4 mb-0 fa-ul text-muted">
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-phone" style="font-size: 15px; color: gray; padding-right: 5px;"></i></span> <%= e.getContact() %></li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-envelope" style="font-size: 15px; color: gray; padding-right: 5px;"></i></span> <%= e.getEmail() %></li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa fa-address-book-o" style="font-size: 20px; color: gray; padding-right: 5px;"></i></span> <%= e.getAddress() %></li>
                                    <li style="margin: 10px 0 10px 0;"><span class="fa-li"><i class="fa-solid fa-calendar-days" style="font-size: 20px; color: gray; padding-right: 5px;"></i></span> Joined <%= dateFormat.format(e.getDatejoin()) %></li>
                                </ul>
                            </div>
                            <div class="col-5 text-center">
                                <img src="/image/<%= e.getUsertype()%>/<%= e.getId()%>" alt="user-avatar" class="img-circle img-fluid" style="max-width: 120px; max-height: 120px;">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer p-3">
                        
                        <%  if (userRole != null){
                                if (userRole.equals(User.MANAGER)){ %>
                                    <a href="/profile/edit/<%= e.getUsertype() %>/<%= e.getId() %>" style="text-decoration: none;">
                                        <i class="fa-regular fa-pen-to-square fa-2xl"></i>
                                    </a>
                                    <a href="/profile/delete/<%= e.getUsertype() %>/<%= e.getId() %>" class="deleteItem" style="text-decoration: none;">
                                        <i class="fa fa-trash fa-2xl"></i>
                                    </a>
                        <%  }} %>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
