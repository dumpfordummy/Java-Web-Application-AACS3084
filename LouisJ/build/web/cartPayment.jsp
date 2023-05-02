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
        <title>Cart Payment</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Product Total Price</th>
                </tr>
            </thead>
            <tbody>
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
                <tr>
                    <td>
                        <img src="images/<%=cartPK.getProduct().getImage()%>" width="100px" alt="alt"/>
                    </td>
                    <td><%=cartPK.getProduct().getName()%></td>
                    <td><%=String.format("%.2f", cartPK.getProduct().getPrice())%></td>
                    <td><%=cartPK.getQty()%></td>
                    <td><%=String.format("%.2f", totalProductPrice)%></td>
                </tr>
                <%
                        subTotal += totalProductPrice;
                    }
                    tax = subTotal * 0.06;
                    totalPayment = subTotal + tax + deliveryCharge - discountAmount;
                %>
            </tbody>
        </table>
        <table>
            <thead>
                <tr>
                    <th>Shipping Address</th>
                    <th>Subtotal</th>
                    <th>Tax</th>
                    <th>Delivery Charge</th>
                    <th>Discount</th>
                    <th>Total Payment</th>
                    <th>Checkout Button</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=cartPKList.get(0).getCustomer().getAddress()%></td>
                    <td><%=String.format("%.2f", subTotal)%></td>
                    <td><%=String.format("%.2f", tax)%></td>
                    <td><%=String.format("%.2f", deliveryCharge)%></td>
                    <td><%=String.format("%.2f", discountAmount)%></td>
                    <td><%=String.format("%.2f", totalPayment)%></td>
                    <td>
                        <form method="POST" action="checkout">
                            <input type="hidden" name="cartPKList" value="<%=cartPKList%>"
                            <input type="hidden" name="customerid" value="<%=cartPKList.get(0).getCustomer().getId()%>">
                            <input type="hidden" name="subTotal" value="<%=subTotal%>">
                            <input type="hidden" name="tax" value="<%=tax%>">
                            <input type="hidden" name="deliveryCharge" value="<%=deliveryCharge%>">
                            <input type="hidden" name="discountAmount" value="<%=discountAmount%>">
                            <input type="hidden" name="totalPayment" value="<%=totalPayment%>">
                            <input type="hidden" name="shippingAddress" value="<%=cartPKList.get(0).getCustomer().getAddress()%>">
                            <input type="submit" value="Checkout">
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
