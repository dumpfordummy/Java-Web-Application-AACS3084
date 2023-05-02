package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-02T09:25:10")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, Double> totalPayment;
    public static volatile SingularAttribute<Payment, Integer> paymentid;
    public static volatile SingularAttribute<Payment, String> customerid;
    public static volatile SingularAttribute<Payment, Double> deliveryCharge;
    public static volatile SingularAttribute<Payment, Double> discountAmount;
    public static volatile SingularAttribute<Payment, String> shippingAddress;
    public static volatile SingularAttribute<Payment, String> paymentMethod;
    public static volatile SingularAttribute<Payment, Double> tax;
    public static volatile SingularAttribute<Payment, Double> subTotal;
    public static volatile SingularAttribute<Payment, String> employeeid;
    public static volatile SingularAttribute<Payment, Date> orderDate;
    public static volatile SingularAttribute<Payment, String> status;

}