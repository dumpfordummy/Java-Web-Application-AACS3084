/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.persistence.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Pua
 */
public class VoucherService {

    @PersistenceContext
    EntityManager mgr;

    public VoucherService() {
    }

    public VoucherService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addVoucher(Voucher voucher) {
        mgr.persist(voucher);
        return true;
    }

    public List<Voucher> findAllVoucher() {
        List<Voucher> voucherList = mgr.createNamedQuery("Voucher.findAllVoucher", Voucher.class).getResultList();
        return voucherList;
    }

    public Voucher findByVoucherid(int voucherid) {
        Voucher voucher = mgr.find(Voucher.class, voucherid);
        return voucher;
    }

    public boolean deleteVoucher(int voucherid) {
        Voucher voucher = findByVoucherid(voucherid);
        if (voucher != null) {
            mgr.remove(voucher);
            return true;
        }
        return false;
    }
}
