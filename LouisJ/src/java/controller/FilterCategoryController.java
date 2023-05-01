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

/**
 *
 * @author Pua
 */
public class FilterCategoryController extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductService productService = new ProductService(em);
        String category = request.getParameter("category");
        category = category.toUpperCase();
        String priceRangeString = request.getParameter("priceRangeInput");
        Double priceRangeDouble;

        List<String> categories = productService.findAllCategory();
        request.setAttribute("categories", categories);

        // Find the max price for filter range
        Double maxPrice = productService.findMaxPrice();
        request.setAttribute("maxPrice", maxPrice);

        if (priceRangeString == "") {
            priceRangeDouble = maxPrice;
        } else {
            priceRangeDouble = Double.parseDouble(priceRangeString);
        }

        // Find product based on category and price
        if (category.equals("ALL")) {
            List<Product> productList = productService.findByPriceRange(priceRangeDouble);
            request.setAttribute("productList", productList);
            request.setAttribute("category", category);
            request.setAttribute("priceRangeInput", priceRangeDouble);
        } else {
            List<Product> productList = productService.findByCategoryAndPriceRange(category, priceRangeDouble);
            request.setAttribute("productList", productList);
            request.setAttribute("category", category);
            request.setAttribute("priceRangeInput", priceRangeDouble);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/product.jsp");
        dispatcher.forward(request, response);
    }
}
