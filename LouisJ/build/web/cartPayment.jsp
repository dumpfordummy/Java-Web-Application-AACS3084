<%-- 
    Document   : cartPayment
    Created on : Apr 28, 2023, 2:17:22 PM
    Author     : Asus
--%>

<%@page import="model.CartPK"%>
<%@page import="model.Product"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page import="model.ProductService"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="navbar.jsp" %>
        <title>Cart Payment</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styling/cartPayment.css">
    </head>
    <body>
        <div class="container">
            <div class="card">
                <div class="container-fliud">
                    <div class="row align-items-start">
                        <div class="col-12 col-sm-8 items">
                            <%
                                List<CartPK> cartPKList = (List<CartPK>) request.getAttribute("cartPKList");
                                double subTotal = 0;
                                double tax;
                                double deliveryCharge = 5;
                                double discountAmount = 5;
                                double totalPayment;
                                double totalProductPrice;
                                for (CartPK cartPK : cartPKList) {
                                    totalProductPrice = cartPK.getProduct().getPrice() * cartPK.getQty();
                            %>
                            <div class="cartItem row align-items-start">
                                <div class="col-3 mb-2">
                                    <img class="w-100" src="images/<%=cartPK.getProduct().getImage()%>" alt="art image">
                                </div>
                                <div class="col-5 mb-2">
                                    <h6 class=""><%=cartPK.getProduct().getName()%></h6>
                                    <p class="pl-1 mb-0">RM<%=String.format("%.2f", cartPK.getProduct().getPrice())%></p>
                                    <p class="pl-1 mb-0"><%=cartPK.getProduct().getCategory()%></p>
                                </div>
                                <div class="col-2">
                                    <p class="cartItemQuantity p-1 text-center"><%=cartPK.getQty()%></p>
                                </div>
                                <div class="col-2">
                                    <p id="cartItem1Price">RM<%=String.format("%.2f", totalProductPrice)%></p>
                                </div>
                            </div>
                            <hr>
                            <%
                                    subTotal += totalProductPrice;
                                }
                                tax = subTotal * 0.06;
                                totalPayment = subTotal + tax + deliveryCharge - discountAmount;
                            %>
                        </div>
                        <div class="col-12 col-sm-4 p-3 proceed form">
                            <div class="row m-0">
                                <div class="col-sm-8 p-0">
                                    <h6>Subtotal</h6>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="subtotal">RM<%=String.format("%.2f", subTotal)%></p>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-8 p-0 ">
                                    <h6>Tax</h6>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="tax">RM<%=String.format("%.2f", tax)%></p>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-8 p-0 ">
                                    <h6>Delivery Charge</h6>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="deliveryCharge">RM<%=String.format("%.2f", deliveryCharge)%></p>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-8 p-0 ">
                                    <h6>Discount Amount</h6>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="discountAmount">RM<%=String.format("%.2f", discountAmount)%></p>
                                </div>
                            </div>
                            <hr>
                            <div class="row mx-0 mb-2">
                                <div class="col-sm-8 p-0 d-inline">
                                    <h5>Total Payment</h5>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="total">RM<%=String.format("%.2f", totalPayment)%></p>
                                </div>
                            </div>
                            <form method="POST" action="checkout">
                                <input type="hidden" name="customerid" value="<%=cartPKList.get(0).getCustomer().getId()%>">
                                <input type="hidden" name="subTotal" value="<%=subTotal%>">
                                <input type="hidden" name="tax" value="<%=tax%>">
                                <input type="hidden" name="deliveryCharge" value="<%=deliveryCharge%>">
                                <input type="hidden" name="discountAmount" value="<%=discountAmount%>">
                                <input type="hidden" name="totalPayment" value="<%=totalPayment%>">
                                <input type="hidden" name="shippingAddress" value="<%=cartPKList.get(0).getCustomer().getAddress()%>">
                                <input type="submit" class="checkout btn btn-default" value="Checkout">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
