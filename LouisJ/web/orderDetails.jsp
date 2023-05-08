<%-- 
    Document   : orderDetails
    Created on : May 8, 2023, 6:00:21 PM
    Author     : CY
--%>

<%@page import="model.Product"%>
<%@page import="model.ProductService"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= getServletContext().getInitParameter("companyName")%> - Order Details</title> 
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="card m-3">
            <table id="salesTable" class="table" style="margin-bottom: 0;">
                <tr style="background-color: #f6b26b; color: white;">
                    <th style="width: 150px;">Product Name</th>
                    <th style="width: 150px;">Product Description</th>
                    <th>Product Image</th>
                    <th style="width: 10%;">Quantity</th>
                </tr>
                <%
                    List<Cart> carts = (List<Cart>) request.getAttribute("orderCarts");
                    List<Product> products = (List<Product>) request.getAttribute("orderProducts");
                    int quantity = 0;
                    if (carts != null && products != null) {

                        for (Product product : products) {
                            for (Cart cart : carts) {
                                if (cart.getProductid().equals(product.getProductid())) {
                                    quantity = cart.getQty();
                                    break;
                                }
                            }
                %>
                <tr>
                    <td><%= product.getCategory()%></td>
                    <td><%= product.getDescription()%></td>
                    <td><img src="images/<%=product.getImage()%>"/></td>
                    <td><%= quantity%></td>
                </tr>
                <% }
                    }
                %>
            </table>
        </div> 
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
