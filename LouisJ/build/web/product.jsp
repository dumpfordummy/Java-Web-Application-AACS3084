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
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>        
        <title>Product</title>
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
                    <th>Button To Product Detail</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Product> productList = (List<Product>) request.getAttribute("productList");
                    for (Product product : productList) {
                %>
                <tr>
                    <td><%=product.getProductid()%></td>
                    <td><%=product.getName()%></td>
                    <td><%=product.getDescription()%></td>
                    <td><%=product.getType()%></td>
                    <td><%=product.getCategory()%></td>
                    <td><%=product.getPrice()%></td>
                    <td>
                        <form method="POST" action="productDetail">
                            <input type="hidden" name="productid" value="<%=product.getProductid()%>">
                            <input type="submit" value="Detail">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
</body>
</html>
