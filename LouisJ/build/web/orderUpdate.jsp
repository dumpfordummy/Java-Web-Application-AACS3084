<%-- 
    Document   : orderUpdate
    Created on : May 3, 2023, 1:08:19 PM
    Author     : Wai Loc
--%>

<%@page import="model.Payment"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= getServletContext().getInitParameter("companyName") %> - Order List</title>
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>        
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <% 
            Payment p = (Payment) request.getAttribute("payment");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
        %>
        <form action="/orderUpdate" method="POST" name="changeStatus" id="changeStatus">
            <h4 style="margin: 20px 10px 10px 20px;">Order Details</h4>
            <div class="row m-3 justify-content-between rounded" style="background-color: #f7c188;">
                <input type='hidden' name="PaymentID" value='<%= p.getPaymentid() %>' />
                <div class="col-10 p-3">
                    Order number: <%= p.getPaymentid() %><br />
                    Date: <%= dateFormat.format(p.getOrderDate()) %><br />
                    <br />
                    <br />
                    <b>Total: RM <%= String.format("%.2f", p.getTotalPayment()) %></b><br />
                </div>
                <div class="col-2 p-3">
                    <p>
                        <span>STATUS: 
                            <select name="orderStatus" id="orderStatus" class="form-control" >
                                <% 
                                    if (p.getStatus().equals("PACKAGING")){
                                %>
                                    <option value="PACKAGING" selected>PACKAGING</option>
                                    <option value="SHIPPING">SHIPPING</option>
                                    <option value="DELIVERING">DELIVERING</option>
                                    <option value="COMPLETED">COMPLETED</option>
                                <% } %>
                                <% 
                                    if (p.getStatus().equals("SHIPPING")){
                                %>
                                    <option value="PACKAGING">PACKAGING</option>
                                    <option value="SHIPPING" selected>SHIPPING</option>
                                    <option value="DELIVERING">DELIVERING</option>
                                    <option value="COMPLETED">COMPLETED</option>
                                <% } %>
                                <% 
                                    if (p.getStatus().equals("DELIVERING")){
                                %>
                                    <option value="PACKAGING">PACKAGING</option>
                                    <option value="SHIPPING">SHIPPING</option>
                                    <option value="DELIVERING" selected>DELIVERING</option>
                                    <option value="COMPLETED">COMPLETED</option>
                                <% } %>
                                <% 
                                    if (p.getStatus().equals("COMPLETED")){
                                %>
                                    <option value="PACKAGING">PACKAGING</option>
                                    <option value="SHIPPING">SHIPPING</option>
                                    <option value="DELIVERING">DELIVERING</option>
                                    <option value="COMPLETED" selected>COMPLETED</option>
                                <% } %>
                            </select>
                        </span>
                    </p>
                </div>
            </div>

            <div class="row" style="margin: 20px;">
                <div class="col-1" style="width: fit-content; margin-right: 5px;">
                    <button type="submit" class="btn btn-success col-12">Update</button>
                </div>
                <div style="width: fit-content">
                    <a href="/orderList" class="btn btn-danger col-12">Back</a>
                </div>
            </div>
        </form>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
