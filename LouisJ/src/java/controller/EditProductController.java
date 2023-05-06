/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Asus
 */
public class EditProductController extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productidStr = request.getParameter("productid");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String priceStr = request.getParameter("price");
        String image = request.getParameter("image");

        try {
            if (name.isEmpty() || description.isEmpty() || category.isEmpty() || priceStr.isEmpty() || image.isEmpty()) {
                response.sendRedirect("/editProduct.jsp?productid=" + productidStr
                        + "&name=" + name
                        + "&description=" + description
                        + "&category=" + category
                        + "&price=" + priceStr
                        + "&error=empty");
                return;
            }

            Product product = new Product();

            ProductService productService = new ProductService(em);

            double price = Double.parseDouble(priceStr);
            Integer productid = Integer.parseInt(productidStr);

            product.setProductid(productid);
            product.setName(name);
            product.setDescription(description);
            product.setCategory(category);
            product.setPrice(price);
            product.setImage(image);

            utx.begin();
            boolean success = productService.updateProduct(product);
            utx.commit();

            response.sendRedirect("/product");
        } catch (Exception ex) {
            Logger.getLogger(AddProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productid = Integer.parseInt(request.getParameter("productid"));
        ProductService productService = new ProductService(em);
        Product product = productService.findProductByProductid(productid);
        response.sendRedirect("/editProduct.jsp?productid=" + productid
                + "&name=" + product.getName()
                + "&description=" + product.getDescription()
                + "&category=" + product.getCategory()
                + "&price=" + product.getPrice());
    }

}
