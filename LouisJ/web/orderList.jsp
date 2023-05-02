<%-- 
    Document   : orderList
    Created on : Apr 17, 2023, 11:05:29 PM
    Author     : Wai Loc
--%>

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
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
    </head>
    <body>

        <div class="row m-3 justify-content-between" style="background-color: #f7c188;">
            <% 
                List<Payment> paymentList = (List<Payment>)request.getAttribute("paymentList");
                for (Payment p : paymentList ){
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
            %>
                <div class="col-8 p-3">
                    Order number: <%= p.getPaymentid() %><br />
                    Date: <%= dateFormat.format(p.getOrderDate()) %><br />
                    <br />
                    <br />
                    Subtotal: RM <%= p.getSubTotal() %><br />
                </div>
                <div class="col-2 p-3">
                    <p>
                        <span>STATUS: </span>
                        <span><%= p.getStatus() %></span>
                    </p>
                </div>
            <% } %>
        </div>
        
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
