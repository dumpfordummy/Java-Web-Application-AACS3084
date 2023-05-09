<%-- 
    Document   : chartReport
    Created on : May 9, 2023, 10:52:07 AM
    Author     : frost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= getServletContext().getInitParameter("companyName")%> - Chart Reports</title> 
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
        <script>
            function resizeIframe(obj) {
                obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
            }
        </script>
    </head>
    <body>
        <% String path = (String) request.getAttribute("iframePath"); %>
        <h3 style="margin: 20px 10px 10px 20px;">Charts</h3>
        <form method="POST" class="col-3 m-3">
            <div class="row">
                <label style="width: auto;">Select Charts: </label>
                <select class="form-control" name="chartSelect" style="width: 16.7%;" onchange="this.form.submit();">
                    <option disabled selected>None</option>
                    <option value="/productQuantity/bar">Total Quantity Sold sorted by Product Category (Bar)</option>
                    <option value="/productQuantity/pie">Total Quantity Sold sorted by Product Category (Pie)</option>
                    <option value="/productSale/bar">Total Sales Made sorted by Product (Bar)</option>
                    <option value="/productSale/pie">Total Sales Made sorted by Product (Pie)</option>
                </select>
            </div>
        </form>

        <div class="row m-3" style="background: white;">
            <% 
                if(!path.isEmpty() || path == null) {
            %>
                <iframe src="<%= path %>" frameborder="0" scrolling="no" onload="resizeIframe(this)" ></iframe>
            <% } %>
        </div>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
