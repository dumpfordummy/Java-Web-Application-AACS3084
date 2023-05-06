<%-- 
    Document   : footer
    Created on : Apr 25, 2023, 9:17:18 AM
    Author     : Pua
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/path/to/font-awesome/css/font-awesome.min.css">

        <title>FOOTER</title>
    </head>
    <body>
        <div class="footer">
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-md-3 item">
                            <h3>Find us here!</h3>
                            <div class="mapouter">
                                <div class="gmap_canvas"><iframe width="100%" height="100%" id="gmap_canvas" src="https://maps.google.com/maps?q=the starhill&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://2yu.co">2yu</a><br><style>.mapouter{
                                            position:relative;
                                            text-align:right;
                                            height:100%;
                                            width:100%;
                                            }</style><a href="https://embedgooglemap.2yu.co/">html embed google map</a><style>.gmap_canvas {
                                            overflow:hidden;
                                            background:none!important;
                                            height:80%;
                                            width:80%;
                                            }</style>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-3 item">
                            <h3>Contact Us!</h3>
                            <ul>
                                <%
                                    String emailParam = getServletContext().getInitParameter("companyEmail");
                                    String phoneNumParam = getServletContext().getInitParameter("companyPhoneNum");
                                %>
                                <li><a href = "mailto: <%= emailParam%>"><div class="footerLink">Email Us</div></a></li>
                                <li><a href="tel:+<%= phoneNumParam%>"><div class="footerLink">Call Us</div></a></li>
                            </ul>
                        </div>
                        <div class="col-md-5 item textFooter">
                            <h3>LOUIS J</h3>
                            <p>Whether you're a fashionista looking for the latest trends, a busy professional in need of a functional bag, or simply someone who appreciates great design and craftsmanship, LouisJ is the ultimate destination for all your bag needs.</p>
                        </div>
                    </div>
                    <%
                        String copyrightParam = getServletContext().getInitParameter("copyright");
                    %>
                    <p class="copyright">&copy; <%= copyrightParam%></p>
                </div>
            </footer>
        </div>
    </body>
</html>
