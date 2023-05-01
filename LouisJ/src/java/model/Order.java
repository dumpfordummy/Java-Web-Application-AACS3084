/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Asus
 */
@Entity
@Table(name = "ORDER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Order1.findAll", query = "SELECT o FROM Order o"),
    @NamedQuery(name = "Order1.findByOrderid", query = "SELECT o FROM Order o WHERE o.orderid = :orderid"),
    @NamedQuery(name = "Order1.findByCustomerid", query = "SELECT o FROM Order o WHERE o.customerid = :customerid"),
    @NamedQuery(name = "Order1.findByEmployeeid", query = "SELECT o FROM Order o WHERE o.employeeid = :employeeid"),
    @NamedQuery(name = "Order1.findBySubtotal", query = "SELECT o FROM Order o WHERE o.subtotal = :subtotal"),
    @NamedQuery(name = "Order1.findByTax", query = "SELECT o FROM Order o WHERE o.tax = :tax"),
    @NamedQuery(name = "Order1.findByDeliverycharge", query = "SELECT o FROM Order o WHERE o.deliverycharge = :deliverycharge"),
    @NamedQuery(name = "Order1.findByDiscountamount", query = "SELECT o FROM Order o WHERE o.discountamount = :discountamount"),
    @NamedQuery(name = "Order1.findByTotalpayment", query = "SELECT o FROM Order o WHERE o.totalpayment = :totalpayment"),
    @NamedQuery(name = "Order1.findByShippingaddress", query = "SELECT o FROM Order o WHERE o.shippingaddress = :shippingaddress"),
    @NamedQuery(name = "Order1.findByPaymentmethod", query = "SELECT o FROM Order o WHERE o.paymentmethod = :paymentmethod"),
    @NamedQuery(name = "Order1.findByStatus", query = "SELECT o FROM Order o WHERE o.status = :status"),
    @NamedQuery(name = "Order1.findByOrderdate", query = "SELECT o FROM Order o WHERE o.orderdate = :orderdate")})
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDERID")
    private Integer orderid;
    @Size(max = 36)
    @Column(name = "CUSTOMERID")
    private String customerid;
    @Size(max = 36)
    @Column(name = "EMPLOYEEID")
    private String employeeid;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "SUBTOTAL")
    private Double subtotal;
    @Column(name = "TAX")
    private Double tax;
    @Column(name = "DELIVERYCHARGE")
    private Double deliverycharge;
    @Column(name = "DISCOUNTAMOUNT")
    private Double discountamount;
    @Column(name = "TOTALPAYMENT")
    private Double totalpayment;
    @Size(max = 50)
    @Column(name = "SHIPPINGADDRESS")
    private String shippingaddress;
    @Size(max = 256)
    @Column(name = "PAYMENTMETHOD")
    private String paymentmethod;
    @Size(max = 256)
    @Column(name = "STATUS")
    private String status;
    @Column(name = "ORDERDATE")
    @Temporal(TemporalType.DATE)
    private Date orderdate;

    public Order() {
    }

    public Order(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getCustomerid() {
        return customerid;
    }

    public void setCustomerid(String customerid) {
        this.customerid = customerid;
    }

    public String getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(String employeeid) {
        this.employeeid = employeeid;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Double getTax() {
        return tax;
    }

    public void setTax(Double tax) {
        this.tax = tax;
    }

    public Double getDeliverycharge() {
        return deliverycharge;
    }

    public void setDeliverycharge(Double deliverycharge) {
        this.deliverycharge = deliverycharge;
    }

    public Double getDiscountamount() {
        return discountamount;
    }

    public void setDiscountamount(Double discountamount) {
        this.discountamount = discountamount;
    }

    public Double getTotalpayment() {
        return totalpayment;
    }

    public void setTotalpayment(Double totalpayment) {
        this.totalpayment = totalpayment;
    }

    public String getShippingaddress() {
        return shippingaddress;
    }

    public void setShippingaddress(String shippingaddress) {
        this.shippingaddress = shippingaddress;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Order)) {
            return false;
        }
        Order other = (Order) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Order1[ orderid=" + orderid + " ]";
    }
    
}
