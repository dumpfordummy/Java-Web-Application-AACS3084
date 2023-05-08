<%-- 
    Document   : salesReport
    Created on : May 7, 2023, 10:14:33 PM
    Author     : frost
--%>

<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="model.ProductService"%>
<%@page import="model.PaymentService"%>
<%@page import="javax.persistence.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= getServletContext().getInitParameter("companyName") %> - Sales Report</title>
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <%@include file="components/common_css_js.jsp" %>
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
    </head>
    <body style="background-color: white !important; overflow-x: hidden;">
        <% 
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
            Date date = new Date();
        %>
        <div class="row">
            <div class="col-12">
                <div class="invoice p-3 mb-3">
                    <div class="row">
                        <div class="col-12">
                            <h4>
                                <img src="images/logo.png" height="100" width="300" class="d-inline-block align-top" alt="LOGO.PNG">
                                <small class="float-end">Date: <%= dateFormat.format(date) %></small>
                            </h4>
                        </div>
                    </div>
                    <h3 style="margin: 20px 10px 10px 0;">Sales Report</h3>
                    <br />
                    <div class="row">
                        <div class="col-12">
                            <table class="table" id="salesTable" style="background-color: #F5F5F5;">
                                <tr style="background-color: #f6b26b; color: white;">
                                    <th style="width: 150px;">Date</th>
                                    <th style="width: 150px;">Order ID</th>
                                    <th>Product</th>
                                    <th style="width: 10%;">Quantity</th>
                                    <th style="width: 200px;">Subtotal (RM) 
                                        <i class="fa-solid fa-sort-down" id="sortTotalDesc" onclick="sortTotal(this);" style="margin-left: 10px;"></i>
                                        <i class="fa-solid fa-sort-up" id="sortTotalAsc" onclick="sortTotal(this);" style="margin-left: 10px; display: none;"></i>
                                    </th>
                                </tr>
                                <jsp:useBean id="payment" class="model.Payment"></jsp:useBean>
                                <jsp:useBean id="product" class="model.Product"></jsp:useBean>
                                <% 
                                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Louis_JPU");
                                    EntityManager em = emf.createEntityManager();
                                    PaymentService paymentService = new PaymentService(em);
                                    ProductService productService = new ProductService(em);
                                    SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd/MM/yyyy");
                                    List<Cart> cartList = (List<Cart>)request.getSession().getAttribute("cartList");
                                    double allTotal = 0;
                                    for (Cart cart : cartList) {
                                        payment = paymentService.findPaymentByPaymentid(cart.getPaymentid());
                                        product = productService.findProductByProductid(cart.getProductid());
                                        allTotal += payment.getTotalPayment();
                                %>
                                <tr>
                                    <td><%= dateFormat2.format(payment.getOrderDate()) %></td>
                                    <td><%= cart.getPaymentid() %></td>
                                    <td><%= product.getName() %></td>
                                    <td><%= cart.getQty() %></td>
                                    <td><%= String.format("%.2f", payment.getTotalPayment()) %></td>
                                </tr>
                                <% } %>
                                <tr>
                                    <td colspan="4" style="text-align: right;"><b>Total &nbsp;</b></td>
                                    <td><b><%= String.format("%.2f", allTotal) %></b></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br /><br />
                </div>
            </div>
        </div>
        <script>
            function sortTotal(element) {
                var id = element.id;
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("salesTable");
                switching = true;
                /*Make a loop that will continue until no switching has been done:*/
                if (id === "sortTotalDesc"){
                    document.getElementById("sortTotalDesc").style.display = "none";
                    document.getElementById("sortTotalAsc").style.display = "inline";
                    while (switching) {
                        //start by saying: no switching is done:
                        switching = false;
                        rows = table.rows;
                        /*Loop through all table rows (except the
                        first, which contains table headers):*/
                        for (i = 1; i < (rows.length - 1); i++) {
                            //start by saying there should be no switching:
                            shouldSwitch = false;
                            /*Get the two elements you want to compare,
                            one from current row and one from the next:*/
                            x = rows[i].getElementsByTagName("TD")[4];
                            y = rows[i + 1].getElementsByTagName("TD")[4];
                            //check if the two rows should switch place:
                            if (Math.round(x.innerHTML) < Math.round(y.innerHTML)) {
                              //if so, mark as a switch and break the loop:
                              shouldSwitch = true;
                              break;
                            }
                        }
                        if (shouldSwitch) {
                            /*If a switch has been marked, make the switch
                            and mark that a switch has been done:*/
                            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                            switching = true;
                        }
                    }
                }
                else {
                    document.getElementById("sortTotalDesc").style.display = "inline";
                    document.getElementById("sortTotalAsc").style.display = "none";
                    while (switching) {
                        //start by saying: no switching is done:
                        switching = false;
                        rows = table.rows;
                        /*Loop through all table rows (except the
                        first, which contains table headers):*/
                        for (i = 1; i < (rows.length - 1); i++) {
                            //start by saying there should be no switching:
                            shouldSwitch = false;
                            /*Get the two elements you want to compare,
                            one from current row and one from the next:*/
                            x = rows[i].getElementsByTagName("TD")[4];
                            y = rows[i + 1].getElementsByTagName("TD")[4];
                            //check if the two rows should switch place:
                            if (Math.round(x.innerHTML) > Math.round(y.innerHTML)) {
                              //if so, mark as a switch and break the loop:
                              shouldSwitch = true;
                              break;
                            }
                        }
                        if (shouldSwitch) {
                            /*If a switch has been marked, make the switch
                            and mark that a switch has been done:*/
                            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                            switching = true;
                        }
                    }
                }
            }
            
            function showFilter(){
                if (document.getElementById("filterBy").value === "Product"){
                    document.getElementById("productFilter").style.display = "block";
                    document.getElementById("dateFilter").style.display = "none";
                }
                else if (document.getElementById("filterBy").value === "Date"){
                    document.getElementById("dateFilter").style.display = "flex";
                    document.getElementById("productFilter").style.display = "none";
                }
            }
        </script>
    </body>
</html>
