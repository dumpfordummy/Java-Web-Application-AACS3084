package model;

import java.time.LocalDate;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-05T21:31:11")
@StaticMetamodel(Voucher.class)
public class Voucher_ { 

    public static volatile SingularAttribute<Voucher, Double> voucherOfferAmount;
    public static volatile SingularAttribute<Voucher, Integer> voucherid;
    public static volatile SingularAttribute<Voucher, LocalDate> voucherExpiryDate;
    public static volatile SingularAttribute<Voucher, String> voucherCode;

}