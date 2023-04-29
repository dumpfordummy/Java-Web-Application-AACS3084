<%-- 
    Document   : salesReport
    Created on : Apr 29, 2023, 4:01:26 PM
    Author     : Wai Loc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Louis J - Sales Report</title>
        <%@include file="navbar.jsp" %> 
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        
        <div class="card m-3">
            <table class="table" style="margin-bottom: 0;">
                <tr style="background-color: #f6b26b; color: white;">
                    <th style="width: 150px;">Date</th>
                    <th style="width: 150px;">Order ID</th>
                    <th style="width: 150px;">Customer ID</th>
                    <th>Product(s)</th>
                    <th style="width: 200px;">Subtotal (RM)</th>
                </tr>
                <tr>
                    <td>12/12/2022</td>
                    <td>XXXX</td>
                    <td>XXXX</td>
                    <td>Bags</td>
                    <td>1000</td>
                </tr>
            </table>

        </div> 
        
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    
    </body>
</html>
