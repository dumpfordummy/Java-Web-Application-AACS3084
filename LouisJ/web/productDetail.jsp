<%-- 
    Document   : productDetail
    Created on : Apr 26, 2023, 9:37:05 PM
    Author     : Asus
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Type</th>
                    <th>Category</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Product product = (Product)session.getAttribute("product");
                %>
                <tr>
                    <td><%=product.getProductid()%></td>
                    <td><%=product.getName()%></td>
                    <td><%=product.getDescription()%></td>
                    <td><%=product.getType()%></td>
                    <td><%=product.getCategory()%></td>
                    <td><%=product.getPrice()%></td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
