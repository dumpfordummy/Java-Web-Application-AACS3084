<%-- 
    Document   : homePage
    Created on : Apr 25, 2023, 9:18:47 AM
    Author     : Pua
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Louis J - Home</title>
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>        
        <link rel="stylesheet" type="text/css" href="styling/homePage.css">
    </head>
    <body>
        <h3 class="heading">Cave of Wonders</h3>
        <div class="container text-center">
            <div class="row">
                <% for (Product product : (List<Product>) request.getAttribute("allProducts")) {%>
                <div class="col">
                    <form method="get" action="filterCategory">
                        <input type="hidden" name="category" value="<%= product.getCategory()%>">
                        <div class="card prodCategory">
                            <button type="submit" name="priceRangeInput">
                                <img src="images/<%=product.getImage()%>" class="card-img-top">
                                <h5 class="card-title">
                                    <%= product.getCategory()%>
                                </h5>
                            </button>
                        </div>
                    </form>
                </div>
                <% } %>
            </div>
        </div>

        <h3 class="heading">Latest Products</h3>
        <div class="container">
            <div class="row product">
                <%
                    List<Product> productList = (List<Product>) request.getAttribute("productList");
                    for (int i = 0; i < 3 && i < productList.size(); i++) {
                %>
                <div class="col-md-4 ">
                    <div class="card">
                        <div class="ccc">
                            <p class="text-center"><img src="images/<%=productList.get(i).getImage()%>" class="imw"></p>
                        </div>
                        <div class="card-body">
                            <h5 class="text-center"><%=productList.get(i).getName()%></h5> 
                            <p class="text-center">RM <%=productList.get(i).getPrice()%></p>
                            <form class="text-center" method="POST" action="productDetail">
                                <input type="hidden" name="productid" value="<%=productList.get(i).getProductid()%>">
                                <input type="submit" value="Learn More" class="cc1">
                            </form>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
