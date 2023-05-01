package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-01T21:42:11")
@StaticMetamodel(Order.class)
public class Order_ { 

    public static volatile SingularAttribute<Order, String> shippingaddress;
    public static volatile SingularAttribute<Order, Double> deliverycharge;
    public static volatile SingularAttribute<Order, Integer> orderid;
    public static volatile SingularAttribute<Order, Double> discountamount;
    public static volatile SingularAttribute<Order, Double> subtotal;
    public static volatile SingularAttribute<Order, String> customerid;
    public static volatile SingularAttribute<Order, Double> tax;
    public static volatile SingularAttribute<Order, Double> totalpayment;
    public static volatile SingularAttribute<Order, Date> orderdate;
    public static volatile SingularAttribute<Order, String> employeeid;
    public static volatile SingularAttribute<Order, String> paymentmethod;
    public static volatile SingularAttribute<Order, String> status;

}