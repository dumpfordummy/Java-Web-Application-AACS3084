package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-06T22:53:46")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, String> shippingaddress;
    public static volatile SingularAttribute<Payment, Double> totalPayment;
    public static volatile SingularAttribute<Payment, Integer> paymentid;
    public static volatile SingularAttribute<Payment, String> customerid;
    public static volatile SingularAttribute<Payment, Double> deliveryCharge;
    public static volatile SingularAttribute<Payment, Double> discountAmount;
    public static volatile SingularAttribute<Payment, Double> tax;
    public static volatile SingularAttribute<Payment, Double> subTotal;
    public static volatile SingularAttribute<Payment, String> employeeid;
    public static volatile SingularAttribute<Payment, Date> orderDate;
    public static volatile SingularAttribute<Payment, String> paymentmethod;
    public static volatile SingularAttribute<Payment, String> status;

}