package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-02T09:02:11")
@StaticMetamodel(Order.class)
public class Order_ { 

    public static volatile SingularAttribute<Order, Double> totalPayment;
    public static volatile SingularAttribute<Order, Integer> orderid;
    public static volatile SingularAttribute<Order, String> customerid;
    public static volatile SingularAttribute<Order, Double> deliveryCharge;
    public static volatile SingularAttribute<Order, Double> discountAmount;
    public static volatile SingularAttribute<Order, String> shippingAddress;
    public static volatile SingularAttribute<Order, String> paymentMethod;
    public static volatile SingularAttribute<Order, Double> tax;
    public static volatile SingularAttribute<Order, Double> subTotal;
    public static volatile SingularAttribute<Order, String> employeeid;
    public static volatile SingularAttribute<Order, Date> orderDate;
    public static volatile SingularAttribute<Order, String> status;

}