<%-- 
    Document   : orderList
    Created on : Apr 17, 2023, 11:05:29 PM
    Author     : Wai Loc
--%>

<%@page import="interfaces.User"%>
<%@page import="util.UserSessionUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Payment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Louis J - Order List</title>
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
    </head>
    <body> 
        <h3 style="margin: 20px 10px 10px 20px;">Order List</h3>
        <% 
            String userRole = (String) request.getAttribute("UserRole");
            boolean success = Boolean.valueOf(String.valueOf(request.getAttribute("updateSuccess")));
            if (success){
        %>
            <div class="row" style="padding: 0.5rem 1rem;">
                <div class="SuccessBox">
                    <i class="fa fa-check-circle-o" style="padding-right: 10px; font-size: 20px;"></i>
                    <label style="padding: 10px;">Order updated successfully!</label>
                    <span class="DivClose" onclick="this.parentNode.parentNode.removeChild(this.parentNode); return false;">&times;</span>
                </div>
            </div>
        <% } %>
        <% 
            List<Payment> paymentList = (List<Payment>) request.getAttribute("paymentList");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
            for (Payment p : paymentList){
                if(p.getStatus().toUpperCase().equals("COMPLETED")){
        %>
            <div class="row m-3 justify-content-between rounded" style="background-color: #29E275;">
                <div class="col-10 p-3">
                    Order number: <%= p.getPaymentid() %><br />
                    Date: <%= dateFormat.format(p.getOrderDate()) %><br />
                    <br />
                    <br />
                    <b>Total: RM <%= String.format("%.2f", p.getTotalPayment()) %></b><br />
                </div>
                <div class="col-2 p-3">
                    <p>
                        <span>STATUS: </span>
                        <span><b><%= p.getStatus() %></b></span>
                    </p>
                </div>
                <%
                    if (userRole != null){
                        if (userRole.equals(User.MANAGER) || userRole.equals(User.STAFF)){
                %>
                <form action="/orderUpdate" method="GET">
                    <input type="hidden" value="<%= p.getPaymentid() %>" name="PaymentID" />
                    <button type="submit" class="btn btn-primary" style="width: 160px; margin: 1rem 2rem">Change Status</button>
                </form>
                <% }} %>
            </div>
        <%      }
                else { %>
                <div class="row m-3 justify-content-between rounded" style="background-color: #f7c188;">
                    <div class="col-10 p-3">
                        Order number: <%= p.getPaymentid() %><br />
                        Date: <%= dateFormat.format(p.getOrderDate()) %><br />
                        <br />
                        <br />
                        <b>Total: RM <%= String.format("%.2f", p.getTotalPayment()) %></b><br />
                    </div>
                    <div class="col-2 p-3">
                        <p>
                            <span>STATUS: </span>
                            <span><b><%= p.getStatus() %></b></span>
                        </p>
                    </div>
                    <%
                        if (userRole != null){
                            if (userRole.equals(User.MANAGER) || userRole.equals(User.STAFF)){
                    %>
                    <form action="/orderUpdate" method="GET">
                        <input type="hidden" value="<%= p.getPaymentid() %>" name="PaymentID" />
                        <button type="submit" class="btn btn-primary" style="width: 160px; margin: 1rem 2rem">Change Status</button>
                    </form>
                    <% }} %>
                </div>
            <%  }} %>
        
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
