<%-- 
    Document   : salesReport
    Created on : Apr 29, 2023, 4:01:26 PM
    Author     : Wai Loc
--%>

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
        <%@include file="navbar.jsp" %> 
        <link rel="stylesheet" href="styling/index.css" type="text/css">
        <link rel="stylesheet" href="styling/listPages.css" text="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a293bfc92d.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <h4 style="margin: 20px 10px 10px 20px;">Sales Report</h4>
        <div class="card m-3">
            <table class="table" style="margin-bottom: 0;">
                <tr style="background-color: #f6b26b; color: white;">
                    <th style="width: 150px;">Date</th>
                    <th style="width: 150px;">Order ID</th>
                    <th>Product(s)</th>
                    <th style="width: 10%;">Quantity</th>
                    <th style="width: 200px;">Subtotal (RM)</th>
                </tr>
                <jsp:useBean id="payment" class="model.Payment"></jsp:useBean>
                <jsp:useBean id="product" class="model.Product"></jsp:useBean>
                <% 
                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Louis_JPU");
                    EntityManager em = emf.createEntityManager();
                    PaymentService paymentService = new PaymentService(em);
                    ProductService productService = new ProductService(em);
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");
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
    
    </body>
</html>
