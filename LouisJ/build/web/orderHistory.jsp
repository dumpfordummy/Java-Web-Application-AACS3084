<%-- 
    Document   : voucher
    Created on : May 1, 2023, 7:49:14 PM
    Author     : Pua
--%>

<%@page import="util.UserSessionUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Payment"%>
<%@page import="interfaces.User"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.Voucher"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
        <link rel="stylesheet" type="text/css" href="styling/orderHistory.css">
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
        <title><%= getServletContext().getInitParameter("companyName") %> - Order History</title>
    </head>
    <body>
        <%
            List<Payment> paymentList = (List<Payment>) request.getAttribute("paymentList");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");

            UserSessionUtil userSessions = new UserSessionUtil(request.getSession());
            User user = userSessions.getCurrentLoginUser(request.getCookies());
        %>
        <div class="d-flex justify-content-center vouchersSelectionTab">
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="packaging-tab" data-bs-toggle="pill" data-bs-target="#pills-packaging" type="button" role="tab" aria-controls="pills-packaging" aria-selected="true">PACKAGING</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="shipping-tab" data-bs-toggle="pill" data-bs-target="#pills-shipping" type="button" role="tab" aria-controls="pills-shipping" aria-selected="false">SHIPPING</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="delivering-tab" data-bs-toggle="pill" data-bs-target="#pills-delivering" type="button" role="tab" aria-controls="pills-delivering" aria-selected="false">DELIVERING</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="completed-tab" data-bs-toggle="pill" data-bs-target="#pills-completed" type="button" role="tab" aria-controls="pills-completed" aria-selected="false">COMPLETED</button>
                </li>
            </ul>
        </div>




        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-packaging" role="tabpanel" aria-labelledby="packaging-tab" tabindex="0">
                <br>

                <%
                    for (Payment p : paymentList) {
                        if (p.getCustomerid().equals(user.getId())) {
                            if (p.getStatus().toUpperCase().equals("PACKAGING")) {
                %>

                <div class="row m-3 justify-content-between rounded" style="background-color: #f7c188;">
                    <div class="col-10 p-3">
                        Order number: <%= p.getPaymentid()%><br />
                        Date: <%= dateFormat.format(p.getOrderDate())%><br />
                        <br />
                        <br />
                        Subtotal: RM <%= p.getSubTotal() + p.getDeliveryCharge() + p.getTax() - p.getDiscountAmount() %><br />
                    </div>
                    <div class="col-2 p-3">
                        <p>
                            <span>STATUS: </span>
                            <span><b><%= p.getStatus()%></b></span>
                        </p>
                    </div>

                    <button class="detailsButton">
                        <a href="/orderHistoryDetails?paymentId=<%= p.getPaymentid()%>" target="_blank">View Details</a>
                    </button>   
                </div>
                <% }
                        }
                    }%>
            </div>


            <div class="tab-pane fade" id="pills-shipping" role="tabpanel" aria-labelledby="shipping-tab" tabindex="0">
                <br>
                <%
                    for (Payment p : paymentList) {
                        if (p.getCustomerid().equals(user.getId())) {
                            if (p.getStatus().toUpperCase().equals("SHIPPING")) {
                %>

                <div class="row m-3 justify-content-between rounded" style="background-color: #f7c188;">
                    <div class="col-10 p-3">
                        Order number: <%= p.getPaymentid()%><br />
                        Date: <%= dateFormat.format(p.getOrderDate())%><br />
                        <br />
                        <br />
                        Subtotal: RM <%= p.getSubTotal() + p.getDeliveryCharge() + p.getTax() - p.getDiscountAmount() %><br />
                    </div>
                    <div class="col-2 p-3">
                        <p>
                            <span>STATUS: </span>
                            <span><b><%= p.getStatus()%></b></span>
                        </p>
                    </div>

                    <button class="detailsButton">
                        <a href="/orderHistoryDetails?paymentId=<%= p.getPaymentid()%>" target="_blank">View Details</a>
                    </button> 
                </div>
                <% }
                        }
                    }%>
            </div>

            <div class="tab-pane fade" id="pills-delivering" role="tabpanel" aria-labelledby="delivering-tab" tabindex="0">
                <br>
                <%
                    for (Payment p : paymentList) {
                        if (p.getCustomerid().equals(user.getId())) {
                            if (p.getStatus().toUpperCase().equals("DELIVERING")) {
                %>

                <div class="row m-3 justify-content-between rounded" style="background-color: #f7c188;">
                    <div class="col-10 p-3">
                        Order number: <%= p.getPaymentid()%><br />
                        Date: <%= dateFormat.format(p.getOrderDate())%><br />
                        <br />
                        <br />
                        Subtotal: RM <%= p.getSubTotal() + p.getDeliveryCharge() + p.getTax() - p.getDiscountAmount() %><br />
                    </div>
                    <div class="col-2 p-3">
                        <p>
                            <span>STATUS: </span>
                            <span><b><%= p.getStatus()%></b></span>
                        </p>
                    </div>
                    <button class="detailsButton">
                        <a href="/orderHistoryDetails?paymentId=<%= p.getPaymentid()%>" target="_blank">View Details</a>
                    </button>    
                </div>
                <% }
                        }
                    }%>
            </div>

            <div class="tab-pane fade" id="pills-completed" role="tabpanel" aria-labelledby="completed-tab" tabindex="0">
                <br>
                <%
                    for (Payment p : paymentList) {
                        if (p.getCustomerid().equals(user.getId())) {
                            if (p.getStatus().toUpperCase().equals("COMPLETED")) {
                %>

                <div class="row m-3 justify-content-between rounded" style="background-color: #29E275;">
                    <div class="col-10 p-3">
                        Order number: <%= p.getPaymentid()%><br />
                        Date: <%= dateFormat.format(p.getOrderDate())%><br />
                        <br />
                        <br />
                        Subtotal: RM <%= p.getSubTotal() + p.getDeliveryCharge() + p.getTax() - p.getDiscountAmount() %><br />
                    </div>
                    <div class="col-2 p-3">
                        <p>
                            <span>STATUS: </span>
                            <span><b><%= p.getStatus()%></b></span>
                        </p>
                    </div>
                    <button class="detailsButton">
                        <a href="/orderHistoryDetails?paymentId=<%= p.getPaymentid()%>" target="_blank">View Details</a>
                    </button>   
                </div>
                <% }
                        }
                    }%>
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
            var success = "<%=request.getParameter("success")%>";
            if (success !=== "null") {
                window.alert("Thank You! Your Payment Placed Successfully!");
            }
        </script>
    </body>
</html>
