<%-- 
    Document   : salesReport
    Created on : Apr 29, 2023, 4:01:26 PM
    Author     : Wai Loc
--%>

<%@page import="model.Product"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page import="model.ProductService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.persistence.*"%>
<%@page import="model.PaymentService"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Louis J - Sales Report</title> 
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <h3 style="margin: 20px 10px 10px 20px;">Sales Report</h3>
        <div class="row" style="margin: 20px 10px 10px 20px;">
            <label style="width: auto;">Filter By: </label>
            <select id="filterBy" class="form-control" style="width: 16.7%;" onchange="showFilter()">
                <option disabled selected>None</option>
                <option value="Product">Product</option>
                <option value="Date">Date</option>
            </select>
        </div>
        <form id="productFilter" action="/salesReport" method="POST" class="col-3 m-3" style="display: none;">
            <select name="filterProduct" class="form-control" onchange="this.form.submit();">
                <option disabled selected>NONE</option>
                <% 
                    List<Product> productList = (List<Product>) request.getAttribute("productList");
                    for(Product product : productList){
                %>
                <option value="<%= product.getProductid()%>"><%= product.getName() %></option>
                <% } %>
            </select>
        </form>
        <form id="dateFilter" action="/salesReport" method="POST" class="col-3 m-3" style="display: none; flex-direction: row;">
            <input type="date" name="dateValue" class="form-control" style="width: auto;" />
            <input type="submit" class="btn btn-primary" style="margin-left: 1rem;" />
        </form>
        <div class="card m-3">
            <table id="salesTable" class="table" style="margin-bottom: 0;">
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
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    List<Cart> cartList = (List<Cart>)request.getAttribute("cartList");
                    for (Cart cart : cartList) {
                        payment = paymentService.findPaymentByPaymentid(cart.getPaymentid());
                        product = productService.findProductByProductid(cart.getProductid());
                %>
                <tr>
                    <td><%= dateFormat.format(payment.getOrderDate()) %></td>
                    <td><%= cart.getPaymentid() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= cart.getQty() %></td>
                    <td>RM <%= String.format("%.2f", payment.getTotalPayment()) %></td>
                </tr>
                <% } %>
            </table>
        </div> 
        
        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
                        /*Loop through all table rows (except the first, which contains table headers):*/
                        for (i = 1; i < (rows.length - 1); i++) {
                            //start by saying there should be no switching: shouldSwitch = false;
                            /*Get the two elements you want to compare, one from current row and one from the next:*/
                            x = rows[i].getElementsByTagName("TD")[4];
                            y = rows[i + 1].getElementsByTagName("TD")[4];
                            //check if the two rows should switch place:
                            if (x.innerHTML < y.innerHTML) {
                              //if so, mark as a switch and break the loop:
                              shouldSwitch = true;
                              break;
                            }
                        }
                        if (shouldSwitch) {
                            /*If a switch has been marked, make the switch and mark that a switch has been done:*/
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
                            if (x.innerHTML > y.innerHTML) {
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
