<%-- 
    Document   : addVoucher
    Created on : May 3, 2023, 8:45:29 PM
    Author     : Pua
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
                    <form runat="server" method="POST" action="addVoucher" class="wrapper row">
                        <h1 class="product-title">Offer Amount:<input class="form-control mr-sm-2" min="0" max="50" type="number" name="voucherAmount"></h1>
                        <h1 class="product-title">Expiry Date:<input class="form-control mr-sm-2" id="myDate" min="{{todayDate}}" type="date" name="voucherExpiry"></h1>
                        <h1 class="product-title">Refer Code:<input class="form-control mr-sm-2" type="text" name="voucherCode"></h1>
                        <input type="submit" class="add-product btn btn-default" value="Add Voucher">
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById("myDate").setAttribute("min", today);
        </script> 
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
