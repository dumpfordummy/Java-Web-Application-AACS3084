<%-- 
    Document   : voucher
    Created on : May 1, 2023, 7:49:14 PM
    Author     : Pua
--%>

<%@page import="interfaces.User"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.Voucher"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
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
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="voucher-expired-tab" data-bs-toggle="pill" data-bs-target="#pills-profile2" type="button" role="tab" aria-controls="pills-profile2" aria-selected="false">EXPIRED</button>
                </li>
            </ul>
        </div>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="voucher-latest-tab" tabindex="0">
                <br>
                <div class="row justify-content-center">
                    <%
                        LocalDate currentDate = LocalDate.now();
                        List<Voucher> voucherLists = (List<Voucher>) request.getAttribute("voucherList");
                        for (Voucher voucher : voucherLists) {
                            long daysUntilExpiry = ChronoUnit.DAYS.between(currentDate, voucher.getVoucherExpiryDate());
                            if (daysUntilExpiry > 3) {
                    %>
                    <div class="col-sm-3">
                        <div class="card" style="margin-bottom:10px">
                            <div class="card-body">
                                <h4 class="card-header text-center voucherHeader" style="font-weight: bold"><%= voucher.getVoucherCode()%></h4>
                                <p class="card-text text-center voucherAmtTxt">Voucher Amount: <span class="badge rounded-pill">RM <%= voucher.getVoucherOfferAmount()%></span></p>
                                <form class="text-center" method="POST" action="deleteVoucher">
                                    <input type="hidden" name="voucherid" value="<%=voucher.getVoucherid()%>">
                                    <%
                                        util.UserSessionUtil userSession = new util.UserSessionUtil(request.getSession());
                                        //Customer customer = new Customer("1001", "test", "056823974923", "test@cust.com", "", "Test Customer", "0137416287", "123, Jln Bunga, 50300 KL");
                                        //Cookie userCookie = userSession.setUserSession(customer);
                                        //response.addCookie(userCookie);
                                        User user = userSession.getCurrentLoginUser(request.getCookies());
                                        if (user != null) {
                                            if (user.getUsertype().equals(User.MANAGER) || user.getUsertype().equals(User.STAFF)) { %>
                                    <input type="submit" value="Delete Voucher" class="btnDelete">
                                    <%  }
                                        }%>
                                </form>
                                <br>
                                <div class="card-footer text-body-secondary text-center">Expiry date: <%= voucher.getVoucherExpiryDate()%></div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <br>
            </div>

            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="voucher-expiring-tab" tabindex="0">
                <br>
                <div class="row justify-content-center">
                    <%
                        for (Voucher voucher : voucherLists) {
                            long daysUntilExpiry = ChronoUnit.DAYS.between(currentDate, voucher.getVoucherExpiryDate());
                            if (daysUntilExpiry <= 3 && daysUntilExpiry >= 0) {
                    %>
                    <div class="col-sm-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-header text-center voucherHeader" style="font-weight: bold"><%= voucher.getVoucherCode()%></h4>
                                <p class="card-text text-center voucherAmtTxt">Voucher Amount: <span class="badge rounded-pill">RM <%= voucher.getVoucherOfferAmount()%></span></p>
                                <form class="text-center" method="POST" action="deleteVoucher">
                                    <input type="hidden" name="voucherid" value="<%=voucher.getVoucherid()%>">
                                    <%
                                        util.UserSessionUtil userSession = new util.UserSessionUtil(request.getSession());
                                        //Customer customer = new Customer("1001", "test", "056823974923", "test@cust.com", "", "Test Customer", "0137416287", "123, Jln Bunga, 50300 KL");
                                        //Cookie userCookie = userSession.setUserSession(customer);
                                        //response.addCookie(userCookie);
                                        User user = userSession.getCurrentLoginUser(request.getCookies());
                                        if (user != null) {
                                            if (user.getUsertype().equals(User.MANAGER) || user.getUsertype().equals(User.STAFF)) { %>
                                    <input type="submit" value="Delete Voucher" class="btnDelete">
                                    <%  }
                                        }%>
                                </form>
                                <br>
                                <div class="card-footer text-body-secondary text-center">Expiry date: <%= voucher.getVoucherExpiryDate()%></div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <br>
            </div>

            <div class="tab-pane fade" id="pills-profile2" role="tabpanel" aria-labelledby="voucher-expired-tab" tabindex="0">
                <br>
                <div class="row justify-content-center">
                    <%
                        for (Voucher voucher : voucherLists) {
                            long daysUntilExpiry = ChronoUnit.DAYS.between(currentDate, voucher.getVoucherExpiryDate());
                            if (daysUntilExpiry < 0) {
                    %>
                    <div class="col-sm-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-header text-center voucherHeader" style="font-weight: bold"><%= voucher.getVoucherCode()%></h4>
                                <p class="card-text text-center voucherAmtTxt">Voucher Amount: <span class="badge rounded-pill">RM <%= voucher.getVoucherOfferAmount()%></span></p>
                                <form class="text-center" method="POST" action="deleteVoucher">
                                    <input type="hidden" name="voucherid" value="<%=voucher.getVoucherid()%>">
                                    <%
                                        util.UserSessionUtil userSession = new util.UserSessionUtil(request.getSession());
                                        //Customer customer = new Customer("1001", "test", "056823974923", "test@cust.com", "", "Test Customer", "0137416287", "123, Jln Bunga, 50300 KL");
                                        //Cookie userCookie = userSession.setUserSession(customer);
                                        //response.addCookie(userCookie);
                                        User user = userSession.getCurrentLoginUser(request.getCookies());
                                        if (user != null) {
                                            if (user.getUsertype().equals(User.MANAGER) || user.getUsertype().equals(User.STAFF)) { %>
                                    <input type="submit" value="Delete Voucher" class="btnDelete">
                                    <%  }
                                        }%>
                                </form>
                                <br>
                                <div class="card-footer text-body-secondary text-center">Expiry date: <%= voucher.getVoucherExpiryDate()%></div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <br>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
