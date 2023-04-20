/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import model.Item;
import model.ItemService;
import java.io.*;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;
import models.Product;
import dao.ProductDao;

/**
 *
 * @author Asus
 */

public class AddProductController extends HttpServlet {
    private Connection connection;
    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            byte[] image = null;
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));

            // Read the uploaded image data and store it as a byte array
            Part imagePart = request.getPart("image");
            if (imagePart != null && imagePart.getSize() > 0) {
                image = new byte[(int) imagePart.getSize()];
                imagePart.getInputStream().read(image);
            }

            // Create a new Product object with the submitted data
            Product product = new Product();
            product.setProductID(productId);
            product.setImage(image);
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);

            // Add the new Product to the database
            productDao.addProduct(product);

            // Redirect to the view all products page
            response.sendRedirect("viewAllProducts.jsp");
        } catch (SQLException | NumberFormatException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    public void destroy() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
