<%-- 
    Document   : homePage
    Created on : Apr 25, 2023, 9:18:47 AM
    Author     : Pua
--%>

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
            <div class="row prodCategory">
                <div class="col">
                    <a href="belt_bag.html">
                        <div class="card">
                            <img src="image/belt_bag_home.png" class="card-img-top">
                            <h5 class="card-title">
                                Belt Bag
                            </h5>
                        </div>
                    </a>
                </div>
                <div class="col">
                    <a href="clutch_bag.html">
                        <div class="card">
                            <img src="image/clutch_bag_home.png" class="card-img-top">
                            <h5 class="card-title">
                                Clutch Bag
                            </h5>
                        </div>
                    </a>
                </div>
                <div class="col">
                    <a href="backpack.html">
                        <div class="card">
                            <img src="image/backpack_home.png" class="card-img-top">
                            <h5 class="card-title">
                                Backpack
                            </h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <h3 class="heading">Latest Products</h3>
        <div class="container">
            <div class="row product">
                <div class="col-md-4 ">
                    <div class="card">
                        <div class="ccc">
                            <p class="text-center"><img src="https://raw.githubusercontent.com/rxhack/productImage/main/1.jpg" class="imw"></p> 
                        </div>
                        <div class="card-body">
                            <h5 class="text-center">Apple Watch Series 3</h5> 
                            <p class="text-center">Price: $550.00</p>
                            <p class="text-center"><input type="submit" name="Save" value="Buy" class=" cc1"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="ccc">
                            <p class="text-center"><img src="https://raw.githubusercontent.com/rxhack/productImage/main/2.jpg" class="imw"></p> 
                        </div>
                        <div class="card-body">
                            <h5  class="text-center">Beat Solo3 Wearless</h5> 
                            <p  class="text-center">Price: $159.99</p>
                            <p class="text-center"><input type="submit" name="Save" value="Buy" class=" cc1"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="ccc">
                            <p class="text-center"><img src="https://raw.githubusercontent.com/rxhack/productImage/main/3.jpg" class="imw"></p> 
                        </div>
                        <div class="card-body">
                            <h5  class="text-center">Apple MacBook</h5> 
                            <p  class="text-center">Price: $2249.00</p>
                            <p class="text-center"><input type="submit" name="Save" value="Buy" class=" cc1"></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row product">
                <div class="col-md-4 ">
                    <div class="card">
                        <div class="ccc">
                            <p class="text-center"><img src="https://raw.githubusercontent.com/rxhack/productImage/main/4.jpg" class="imw"></p> 
                        </div>
                        <div class="card-body">
                            <h5  class="text-center">Apple imac</h5> 
                            <p  class="text-center">Price: $1699.99</p>
                            <p class="text-center"><input type="submit" name="Save" value="Buy" class=" cc1"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="ccc">
                            <p class="text-center"><img src="https://raw.githubusercontent.com/rxhack/productImage/main/6.jpg" class="imw"></p> 
                        </div>
                        <div class="card-body">
                            <h5  class="text-center">Apple ipad Air</h5> 
                            <p  class="text-center">Price: $415.99</p>
                            <p class="text-center"><input type="submit" name="Save" value="Buy" class=" cc1"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="ccc">
                            <p class="text-center"><img src="https://raw.githubusercontent.com/rxhack/productImage/main/7.jpg" class="imw"></p> 
                        </div>
                        <div class="card-body">
                            <h5  class="text-center">Apple iphone X</h5> 
                            <p  class="text-center">Price: $1342.00</p>
                            <p class="text-center"><input type="submit" name="Save" value="Buy" class=" cc1"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
