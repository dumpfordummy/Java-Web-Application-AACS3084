<%-- 
    Document   : editProduct
    Created on : May 5, 2023, 5:53:30 PM
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
        <%
            String productid = request.getParameter("productid");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            String error = request.getParameter("error");
        %>
        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <form runat="server" method="POST" action="editProduct" class="wrapper row">
                        <div class="preview col-md-6">
                            <div class="preview-pic tab-content">
                                <img class="rounded" id="blah" src="#" /><br/>
                                <input type='file' id="image" name="image"/>
                            </div>
                        </div>
                        <div class="details col-md-6">
                            <input type="hidden" name="productid" value="<%=productid%>">
                            <h1 class="product-title">Name:<input class="form-control mr-sm-2" type="text" name="name" id="name" onkeypress="return /[a-zA-Z ]/.test(event.key)"></h1>
                            <h1 class="product-title">Description:<input class="form-control mr-sm-2" type="text" name="description" id="description" onkeypress="return /[a-zA-Z ]/.test(event.key)"></h1>
                            <h1 class="product-title">Price:<input class="form-control mr-sm-2" type="number" step="1" name="price" id="price"></h1>
                            <h1 class="product-title">Category:<input class="form-control mr-sm-2" type="text" name="category" id="category" onkeypress="return /[a-zA-Z ]/.test(event.key)"></h1>
                            <input type="submit" class="add-product btn btn-default" value="Confirm Edit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            image.onchange = evt => {
                const [file] = image.files;
                if (file) {
                    blah.src = URL.createObjectURL(file);
                }
            };

            var error = "<%=error%>";
            document.getElementById("name").value = "<%= name%>";
            document.getElementById("description").value = "<%= description%>";
            document.getElementById("price").value = "<%= price%>";
            document.getElementById("category").value = "<%= category%>";

            if (error == "empty") {
                window.alert("PLEASE FILL IN ALL THE INFORMATION");
            }

            const priceInput = document.getElementById("price");

            priceInput.addEventListener("input", function () {
                let price = parseFloat(this.value);
                let decimalIndex = price.toString().indexOf(".");
                let decimalPlaces = 0;
                if (decimalIndex !== -1) {
                    let decimalPlaces = price.toString().length - decimalIndex - 1;
                    if (decimalPlaces > 2) {
                        price = Math.round(price * 100) / 100;
                        this.value = price.toFixed(2);
                    }
                }
            });
        </script>    
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
