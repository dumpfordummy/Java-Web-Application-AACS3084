/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;

import javax.servlet.http.Part;

/**
 *
 * @author Asus
 */

@WebServlet("/addProduct")
public class AddProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void init() throws ServletException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
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
            product.setImage(image);
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);

            // Redirect to the view all products page
            response.sendRedirect("viewAllProducts.jsp");
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
