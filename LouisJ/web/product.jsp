<%-- 
    Document   : product
    Created on : Apr 24, 2023, 8:51:24 PM
    Author     : Asus
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Product> productList = (List<Product>)request.getAttribute("productList");
                    for(Product product : productList){
                %>
                    <tr>
                        <td><%=product.getProductid()%></td>
                        <td><img src="data:image/png;base64,<%=product.getImage()%>" alt="Product Image" /></td>
                        <td><%=product.getName()%></td>
                        <td><%=product.getPrice()%></td>
                        <td><%=product.getDescription()%></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
