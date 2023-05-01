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
                            <h5 style="visibility:hidden" class="sizes">sizes:
                                <span class="size" data-toggle="tooltip" title="small">s</span>
                                <span class="size" data-toggle="tooltip" title="medium">m</span>
                                <span class="size" data-toggle="tooltip" title="large">l</span>
                                <span class="size" data-toggle="tooltip" title="xtra large">xl</span>
                            </h5>
                            <h5 style="visibility:hidden" class="colors">colors:
                                <span class="color orange not-available" data-toggle="tooltip" title="Not In store"></span>
                                <span class="color green"></span>
                                <span class="color blue"></span>
                            </h5>
                            <form method="POST" action="addToCart">
                                <input type="hidden" name="productid" value="<%=product.getProductid()%>">
                                <input type="submit" class="add-to-cart btn btn-default" value="Add To Cart">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--            <div class="product-info-tabs">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                <p><%=product.getDescription()%></p>
                            </div>
                            <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                                <div class="review-heading">REVIEWS</div>
                                <p class="mb-20">There are no reviews yet.</p>
                                <form class="review-form">
                                    <div class="form-group">
                                        <label>Your rating</label>
                                        <div class="reviews-counter">
                                            <div class="rate">
                                                <input type="radio" id="star5" name="rate" value="5" />
                                                <label for="star5" title="text">5 stars</label>
                                                <input type="radio" id="star4" name="rate" value="4" />
                                                <label for="star4" title="text">4 stars</label>
                                                <input type="radio" id="star3" name="rate" value="3" />
                                                <label for="star3" title="text">3 stars</label>
                                                <input type="radio" id="star2" name="rate" value="2" />
                                                <label for="star2" title="text">2 stars</label>
                                                <input type="radio" id="star1" name="rate" value="1" />
                                                <label for="star1" title="text">1 star</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Your message</label>
                                        <textarea class="form-control" rows="10"></textarea>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" name="" class="form-control" placeholder="Name*">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" name="" class="form-control" placeholder="Email Id*">
                                            </div>
                                        </div>
                                    </div>
                                    <button class="round-black-btn">Submit Review</button>
                                </form>
                            </div>
                        </div>
                    </div>-->
    </div>

    <!--        <div class="container px-4 text-center">
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
            </div>-->
    <%@include file="footer.jsp" %>
</body>
</html>
