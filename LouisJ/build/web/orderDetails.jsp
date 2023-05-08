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
        <title>JSP Page</title>
    </head>
    <body>
        <table class="sortable">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Product Description</th>
                    <th>Product Image</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
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
            </tbody>
        </table>
    </body>
</html>
