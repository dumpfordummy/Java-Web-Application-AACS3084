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
        <link rel="stylesheet" type="text/css" href="styling/productDetail.css">
        <%
            Product product = (Product) session.getAttribute("product");
        %>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="wrapper row">
                        <div class="preview col-md-6">
                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"><img src="images/<%=product.getImage()%>" /></div>
                            </div>
                        </div>
                        <div class="details col-md-6">
                            <h1 class="product-title"><%=product.getName()%></h1>
                            <div class="rating">
                                <div class="stars">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </div>
                                <span class="review-no">41 reviews</span>
                            </div>
                            <p class="product-description"><%=product.getDescription()%>.</p>
                            <h4 class="price">RM<span> <%=product.getPrice()%></span></h4>
                            <p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
                            <form method="POST" action="addToCart">
                                <input type="hidden" name="productid" value="<%=product.getProductid()%>">
                                <input type="submit" class="add-to-cart btn btn-default" value="Add To Cart">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
