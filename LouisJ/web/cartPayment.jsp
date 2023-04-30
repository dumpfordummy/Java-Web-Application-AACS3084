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
                    double deliveryCharge = 5;
                    double discount = 5;
                    double tax;
                    double totalPayment;
                    for (CartPK cartPK : cartPKList) {
                %>
                <tr>
                    <td>
                        <img src="image/<%=cartPK.getProduct().getImage()%>" width="100px" alt="alt"/>
                    </td>
                    <td><%=cartPK.getProduct().getName()%></td>
                    <td><%=cartPK.getProduct().getPrice()%></td>
                    <td><%=cartPK.getQty()%></td>
                    <td><%=cartPK.getProduct().getPrice() * cartPK.getQty()%></td>
                </tr>
                <%
                    subTotal += cartPK.getProduct().getPrice() * cartPK.getQty();
                    }
                    tax = subTotal * 0.06;
                    totalPayment = subTotal + tax + deliveryCharge - discount;
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
                    <
                    <th>Checkout Button</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%=cartPKList.get(0).getCustomer().getUsername()%></td>
                    <td><%=subTotal%></td>
                    <td><%=tax%></td>
                    <td><%=deliveryCharge%></td>
                    <td><%=discount%></td>
                    <td><%=totalPayment%></td>
                    <td>
                        <form method="POST" action="checkout">
                            <input type="hiddent" name="" value="">
                            <input type="submit" value="Checkout">
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
