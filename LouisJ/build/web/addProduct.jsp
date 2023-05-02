<%-- 
    Document   : addProduct
    Created on : Mar 19, 2023, 11:15:08 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
        <title>Add Product</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styling/addProduct.css">
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <form runat="server" method="POST" action="addProduct" class="wrapper row">
                        <div class="preview col-md-6">
                            <div class="preview-pic tab-content">
                                <input type='file' id="imgInp" name="image"/><br/>
                                <img id="blah" src="#" />
                            </div>
                        </div>
                        <div class="details col-md-6">
                            <h1 class="product-title">Name:<input class="form-control mr-sm-2" type="text" name="name"></h1>
                            <h1 class="product-title">Description:<input class="form-control mr-sm-2" type="text" name="description"></h1>
                            <h1 class="product-title">Price:<input class="form-control mr-sm-2" type="number" step="0.01" name="price"></h1>
                            <h1 class="product-title">Category:<input class="form-control mr-sm-2" type="text" name="category"></h1>
                            <input type="submit" class="add-product btn btn-default" value="Add To Cart">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            imgInp.onchange = evt => {
                const [file] = imgInp.files;
                if (file) {
                    blah.src = URL.createObjectURL(file);
                }
            };
        </script>    
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
