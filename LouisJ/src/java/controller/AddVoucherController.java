/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.Product;
import model.ProductService;
import model.Voucher;
import model.VoucherService;

/**
 *
 * @author Pua
 */
public class AddVoucherController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            VoucherService voucherService = new VoucherService(em);
            List<Voucher> voucherList = voucherService.findAllVoucher();
            int lastVoucherid;
            if (voucherList.isEmpty()) {
                lastVoucherid = 0;
            } else {
                voucherList.sort((v1, v2) -> v2.getVoucherid() - v1.getVoucherid());
                lastVoucherid = voucherList.get(0).getVoucherid();
            }

            double voucherAmount = Double.parseDouble(request.getParameter("voucherAmount"));
            String voucherCode = request.getParameter("voucherCode");
            String expiryDateStr = request.getParameter("voucherExpiry");
            LocalDate expiryDate = LocalDate.parse(expiryDateStr);

            Voucher voucher = new Voucher();
            voucher.setVoucherOfferAmount(voucherAmount);
            voucher.setVoucherid(lastVoucherid + 1);
            voucher.setVoucherCode(voucherCode);
            voucher.setVoucherExpiryDate(expiryDate);

            utx.begin();
            boolean success = voucherService.addVoucher(voucher);
            utx.commit();

            response.sendRedirect(request.getContextPath() + "/voucher");
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
