/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.ProductService;
import model.Voucher;
import model.VoucherService;

/**
 *
 * @author Pua
 */
public class VoucherController extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VoucherService voucherService = new VoucherService(em);

        // Find all voucher
        List<Voucher> voucherList = voucherService.findAllVoucher();
        request.setAttribute("voucherList", voucherList);
       

        RequestDispatcher dispatcher = request.getRequestDispatcher("/voucher.jsp");
        dispatcher.forward(request, response);

    }
}
