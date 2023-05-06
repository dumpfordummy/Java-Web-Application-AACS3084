<%-- 
    Document   : cartPayment
    Created on : Apr 28, 2023, 2:17:22 PM
    Author     : Asus
--%>

<%@page import="model.Voucher"%>
<%@page import="java.awt.Image"%>
<%@page import="java.io.File"%>
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
                                double deliveryCharge = 25;
                                double totalPayment;
                                double totalProductPrice;
                                for (CartPK cartPK : cartPKList) {
                                    totalProductPrice = cartPK.getProduct().getPrice() * cartPK.getQty();
                            %>
                            <div class="cartItem row align-items-start">
                                <div class="col-3 mb-2">
                                    <img class="w-100" src="images/<%=cartPK.getProduct().getImage()%>" alt="art image">
                                </div>

                                <div class="col-4 mb-2">
                                    <h6 class=""><%=cartPK.getProduct().getName()%></h6>
                                    <p class="pl-1 mb-0 price">RM<%=String.format("%.2f", cartPK.getProduct().getPrice())%></p>
                                    <p class="pl-1 mb-0"><%=cartPK.getProduct().getCategory()%></p>
                                </div>
                                <form id="myForm" method="GET" action="editCartPayment" class="col-2">
                                    <input type="hidden" name="cartid" value="<%=cartPK.getCartid()%>">
                                    <input min="1" class="form-control productQtyInput" type="number" name="cartQty" onchange="submitForm()" value="<%=cartPK.getQty()%>">
                                </form>
                                <div class="col-2">
                                    <p class="cartItemPrice">RM<%=String.format("%.2f", totalProductPrice)%></p>
                                </div>
                                <form method="POST" action="deleteCartPayment" class="col-1">
                                    <input type="hidden" value="<%=cartPK.getCartid()%>" name="cartid">
                                    <input type="submit" value="X" class="btnDelete">
                                </form>
                            </div>
                            <hr>
                            <%
                                    subTotal += totalProductPrice;
                                }
                                tax = subTotal * 0.06;
                                if(subTotal > 200){
                                    deliveryCharge = 0;
                                }
                                totalPayment = subTotal + tax + deliveryCharge;
                            %>
                        </div>
                        <form method="POST" action="checkout" class="col-12 col-sm-4 p-3 proceed form">
                            <div class="row m-0">
                                <div class="col-sm-12 p-0">
                                    <h5>Shipping Address:</h5>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-12 p-0">
                                    <input class="form-control" type="text" name="shippingAddress" value="<%=cartPKList.get(0).getCustomer().getAddress()%>">
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-12 p-0">
                                    <h5>Payment Method:</h5>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-12 p-0">
                                    <select class="form-control" id="paymentMethod" onchange="paymentMethodOnchange()" name="paymentMethod">
                                        <option value="CASH">Cash On Delivery</option>
                                        <option value="CARD">Card</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-8 p-0">
                                    <h5>Subtotal</h5>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="subtotal">RM<%=String.format("%.2f", subTotal)%></p>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-8 p-0 ">
                                    <h5>(+)Tax</h5>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="tax">RM<%=String.format("%.2f", tax)%></p>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-8 p-0 ">
                                    <h5>(+)Delivery Charge</h5>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="deliveryCharge">RM<%=String.format("%.2f", deliveryCharge)%></p>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-12 p-0">
                                    <h5>Voucher:</h5>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-12 p-0">
                                    <select class="form-control" id="voucher" onchange="voucherOnchange()" name="voucher">
                                        <option value="0" selected></option>
                                        <%
                                            
                                            if(request.getAttribute("voucherList") != null){
                                                List<Voucher> voucherList = (List<Voucher>) request.getAttribute("voucherList");
                                                for(Voucher voucher : voucherList){
                                        %>
                                        <option value="<%=voucher.getVoucherOfferAmount()%>"><%=voucher.getVoucherCode()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="row m-0">
                                <div class="col-sm-8 p-0 ">
                                    <h5>(-)Discount Amount</h5>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="discountAmount">RM0.00</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row mx-0 mb-2">
                                <div class="col-sm-8 p-0 d-inline">
                                    <h4>Total Payment</h4>
                                </div>
                                <div class="col-sm-4 p-0">
                                    <p id="total">RM<%=String.format("%.2f", totalPayment)%></p>
                                </div>
                            </div>
                            <div id="cardMethod" style="visibility: hidden">
                                <div class="row mx-0 mb-2">
                                    <div class="col-sm-12 p-0 d-inline">
                                        <h4>Card Number:</h4>
                                    </div>
                                </div>
                                <div class="row mx-0 mb-2">
                                    <div class="col-sm-12 p-0 d-inline">
                                        <input class="form-control" type="text" name="cardNumber" id="cardNumber">
                                    </div>
                                </div>
                                <div class="row mx-0 mb-2">
                                    <div class="col-sm-12 p-0 d-inline">
                                        <h4>Expiration Date:</h4>
                                    </div>
                                </div>
                                <div class="row mx-0 mb-2">
                                    <div class="col-sm-12 p-0 d-inline">
                                        <input class="form-control" type="date" name="expDate" id="expDate">
                                    </div>
                                </div>
                                <div class="row mx-0 mb-2">
                                    <div class="col-sm-12 p-0 d-inline">
                                        <h4>CVV:</h4>
                                    </div>
                                </div>
                                <div class="row mx-0 mb-2">
                                    <div class="col-sm-12 p-0 d-inline">
                                        <input class="form-control" type="text" name="CVV" id="CVV">
                                    </div>
                                </div>
                            </div>


                            <input type="hidden" name="customerid" value="<%=cartPKList.get(0).getCustomer().getId()%>">
                            <input type="hidden" id="subTotalPost" name="subTotal" value="<%=subTotal%>">
                            <input type="hidden" id="taxPost" name="tax" value="<%=tax%>">
                            <input type="hidden" id="deliveryChargePost" name="deliveryCharge" value="<%=deliveryCharge%>">
                            <input type="hidden" id="discountAmountPost" name="discountAmount" value="0">
                            <input type="hidden" id="totalPaymentPost" name="totalPayment" value="<%=totalPayment%>">


                            <input type="submit" class="checkout btn btn-default" value="Checkout">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function paymentMethodOnchange() {
                var paymentMethod = document.getElementById("paymentMethod").value;
                var cardMethod = document.getElementById("cardMethod");

                if (paymentMethod === "CASH") {
                    cardMethod.style.visibility = 'hidden';
                } else if (paymentMethod === "CARD") {
                    cardMethod.style.visibility = 'visible';
                }

            }
            
            function updateCartItemPrice(input) {
                var itemRow = input.closest('.cartItem');
                var priceElem = itemRow.querySelector('.price');
                var qty = parseInt(input.value);
                var price = parseFloat(priceElem.innerText.replace('RM', '').trim());
                var totalProductPrice = qty * price;
                var cartItemPriceElem = itemRow.querySelector('.cartItemPrice');
                cartItemPriceElem.innerText = 'RM' + totalProductPrice.toFixed(2);

                // Get all the totalPriceElement elements
                const totalPriceElements = document.querySelectorAll('.cartItemPrice');

                // Initialize the subtotal variable
                let subtotal = 0;

                // Loop through all the totalPriceElement elements and add up their values
                totalPriceElements.forEach(element => {
                    subtotal += parseFloat(element.textContent.substring(2));
                });

                var subTotalElement = document.getElementById("subtotal");
                subTotalElement.innerHTML = "RM" + subtotal.toFixed(2);

                var tax = parseFloat(subtotal) * 0.06;
                var taxElement = document.getElementById("tax");
                taxElement.innerHTML = "RM" + tax.toFixed(2);

                var deliveryChargeElement = document.getElementById("deliveryCharge");
                var deliveryCharge;
                if(parseFloat(subtotal) > 200){
                    deliveryCharge = 0;
                    deliveryChargeElement.innerHTML = "RM0.00";
                } else {
                    deliveryCharge = 25;
                    deliveryChargeElement.innerHTML = "RM25.00";
                }
                
                var totalElement = document.getElementById("total");
                var voucher = document.getElementById("voucher").value;
                var total = parseFloat(subtotal) + parseFloat(tax) + parseFloat(deliveryCharge) - parseFloat(voucher);
                totalElement.innerHTML = "RM" + total.toFixed(2);
                
                var subTotalPost = document.getElementById("subTotalPost");
                var taxPost = document.getElementById("taxPost");
                var deliveryChargePost = document.getElementById("deliveryChargePost");
                var discountAmountPost = document.getElementById("discountAmountPost");
                var totalPaymentPost = document.getElementById("totalPaymentPost");
                subTotalPost.value = subtotal;
                taxPost.value = tax;
                deliveryChargePost.value = deliveryCharge;
                discountAmountPost.value = document.getElementById("voucher").value;
                totalPaymentPost.value = total;
                
                this.submit();
            }
            
            function voucherOnchange(){
                var voucher = document.getElementById("voucher").value;
                var discountAmount = document.getElementById("discountAmount");
                var fixedVoucher = parseFloat(voucher).toFixed(2);
                discountAmount.innerHTML = "RM" + fixedVoucher;
                
                // Get all the totalPriceElement elements
                const totalPriceElements = document.querySelectorAll('.cartItemPrice');

                // Initialize the subtotal variable
                let subtotal = 0;

                // Loop through all the totalPriceElement elements and add up their values
                totalPriceElements.forEach(element => {
                    subtotal += parseFloat(element.textContent.substring(2));
                });
                
                var tax = parseFloat(subtotal) * 0.06;
                var deliveryCharge;
                if(parseFloat(subtotal) > 200){
                    deliveryCharge = 0;
                } else {
                    deliveryCharge = 25;
                }
                
                var totalElement = document.getElementById("total");
                var total = parseFloat(subtotal) + parseFloat(tax) + parseFloat(deliveryCharge) - parseFloat(voucher);
                totalElement.innerHTML = "RM" + total.toFixed(2);
                
                var subTotalPost = document.getElementById("subTotalPost");
                var taxPost = document.getElementById("taxPost");
                var deliveryChargePost = document.getElementById("deliveryChargePost");
                var discountAmountPost = document.getElementById("discountAmountPost");
                var totalPaymentPost = document.getElementById("totalPaymentPost");
                subTotalPost.value = subtotal;
                taxPost.value = tax;
                deliveryChargePost.value = deliveryCharge;
                discountAmountPost.value = document.getElementById("voucher").value;
                totalPaymentPost.value = total;
            }

            function submitForm() {
                document.getElementById("myForm").submit();
            }
            
            var error = "<%=request.getAttribute("error")%>";
            if (error !== "null") {
                window.alert("Please fill in the payment information!");
            }
        </script>
    </body>
    <footer>
        <%@include file="footer.jsp" %>
    </footer>
</html>
