<%-- 
    Document   : voucher
    Created on : May 1, 2023, 7:49:14 PM
    Author     : Pua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
        <link rel="stylesheet" type="text/css" href="styling/voucher.css">
        <title>Louis J - Voucher</title>
    </head>
    <body>
        <div class="d-flex justify-content-center vouchersSelectionTab">
            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="voucher-latest-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">LATEST</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="voucher-expiring-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">EXPIRING</button>
                </li>
            </ul>
        </div>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="voucher-latest-tab" tabindex="0">...</div>
            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="voucher-expiring-tab" tabindex="0">...</div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
