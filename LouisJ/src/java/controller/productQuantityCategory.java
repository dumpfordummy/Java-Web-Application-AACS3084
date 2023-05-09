/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.CartService;
import model.Product;
import model.ProductService;

/**
 *
 * @author CY
 */
@WebServlet(name = "productQuantityCategoryBAR", urlPatterns = {"/productQuantity/*"})
public class productQuantityCategory extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String[] paths = request.getRequestURI().substring(1).split("/");

            ProductService productService = new ProductService(em);
            List<String> categoryList = productService.findAllCategory();
            CartService cartService = new CartService(em);
            TreeMap<String, Integer> productCount = new TreeMap<>();

            for (String category : categoryList) {
                Integer count = cartService.findCountByProductCategory(category);
                productCount.put(category, count);
            }

            request.setAttribute("productCount", productCount);

            if (paths[1].equals("bar")) {
                request.getRequestDispatcher("/productQuantityCategoryBAR.jsp").forward(request, response);

            } else if (paths[1].equals("pie")) {
                request.getRequestDispatcher("/productQuantityCategoryPIE.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
