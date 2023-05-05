/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Pua
 */
@Entity
@Table(name = "VOUCHER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findByVoucherid", query = "SELECT v FROM Voucher v WHERE v.voucherid = :voucherid"),
    @NamedQuery(name = "Voucher.findAllVoucher", query = "SELECT v FROM Voucher v")
})

public class Voucher implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "VOUCHERID")
    private Integer voucherid;

    @Column(name = "VOUCHEROFFERAMOUNT")
    private Double voucherOfferAmount;

    @Column(name = "VOUCHEREXPIRYDATE")
    private LocalDate voucherExpiryDate;

    @Column(name = "VOUCHERCODE")
    private String voucherCode;

    public Voucher() {
    }

    public Voucher(Integer voucherid, Double voucherOfferAmount, LocalDate voucherExpiryDate, String voucherCode) {
        this.voucherid = voucherid;
        this.voucherOfferAmount = voucherOfferAmount;
        this.voucherExpiryDate = voucherExpiryDate;
        this.voucherCode = voucherCode;
    }

    public Integer getVoucherid() {
        return voucherid;
    }

    public void setVoucherid(Integer voucherid) {
        this.voucherid = voucherid;
    }

    public Double getVoucherOfferAmount() {
        return voucherOfferAmount;
    }

    public void setVoucherOfferAmount(Double voucherOfferAmount) {
        this.voucherOfferAmount = voucherOfferAmount;
    }

    public LocalDate getVoucherExpiryDate() {
        return voucherExpiryDate;
    }

    public void setVoucherExpiryDate(LocalDate voucherExpiryDate) {
        this.voucherExpiryDate = voucherExpiryDate;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 97 * hash + Objects.hashCode(this.voucherid);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Voucher other = (Voucher) obj;
        return Objects.equals(this.voucherid, other.voucherid);
    }

    @Override
    public String toString() {
        return "Voucher{" + "voucherid=" + voucherid + '}';
    }

}
