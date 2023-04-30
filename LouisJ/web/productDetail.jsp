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
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>    
        <title>Product Detail</title>
        <%
            Product product = (Product) session.getAttribute("product");
        %>
    </head>
    <body>
        <div class="container px-4 text-center">
            <div class="row gx-5">
                <div class="col">
                    <div class="p-3">
                        <img src="images/<%=product.getImage()%>" class="card-img-top"/>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Add To Cart</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%=product.getProductid()%></td>
                                    <td><%=product.getName()%></td>
                                    <td><%=product.getDescription()%></td>
                                    <td><%=product.getCategory()%></td>
                                    <td><%=product.getPrice()%></td>
                                    <td>
                                        <form method="POST" action="addToCart">
                                            <input type="hidden" name="productid" value="<%=product.getProductid()%>">
                                            <input type="submit" value="Add To Cart">
                                        </form>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
