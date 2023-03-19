/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import models.Product;

/**
 *
 * @author YKX
 */

public class ProductDao {
    private String host = "jdbc:derby://localhost:1527/louisjdb";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "Product";
    private Connection connection;
    private PreparedStatement stmt;

    public ProductDao(Connection connection) {
      this.connection = connection;
    }

    public void addProduct(Product product) throws SQLException {
      stmt = connection.prepareStatement("INSERT INTO " + tableName + " (image, name, description, price) VALUES (?, ?, ?, ?)");
      stmt.setBytes(1, product.getImage());
      stmt.setString(2, product.getName());
      stmt.setString(3, product.getDescription());
      stmt.setDouble(4, product.getPrice());
      stmt.executeUpdate();
    }

    public Product getProduct(int productID) throws SQLException {
      stmt = connection.prepareStatement("SELECT * FROM " + tableName + " WHERE productID = ?");
      stmt.setInt(1, productID);
      ResultSet result = stmt.executeQuery();

      if (result.next()) {
        Product product = new Product();
        product.setProductID(result.getInt("productID"));
        product.setImage(result.getBytes("image"));
        product.setName(result.getString("name"));
        product.setDescription(result.getString("description"));
        product.setPrice(result.getDouble("price"));
        return product;
      } else {
        return null;
      }
    }

    public List<Product> getAllProducts() throws SQLException {
      List<Product> productList = new ArrayList<Product>();
      stmt = connection.prepareStatement("SELECT * FROM " + tableName);
      ResultSet result = stmt.executeQuery();

      while (result.next()) {
        Product product = new Product();
        product.setProductID(result.getInt("productID"));
        product.setImage(result.getBytes("image"));
        product.setName(result.getString("name"));
        product.setDescription(result.getString("description"));
        product.setPrice(result.getDouble("price"));
        productList.add(product);
      }

      return productList;
    }

    public void updateProduct(Product product) throws SQLException {
      stmt = connection.prepareStatement("UPDATE " + tableName + " SET image = ?, name = ?, description = ?, price = ? WHERE productID = ?");
      stmt.setBytes(1, product.getImage());
      stmt.setString(2, product.getName());
      stmt.setString(3, product.getDescription());
      stmt.setDouble(4, product.getPrice());
      stmt.setInt(5, product.getProductID());
      stmt.executeUpdate();
    }

    public void deleteProduct(int productID) throws SQLException {
      stmt = connection.prepareStatement("DELETE FROM " + tableName + " WHERE productID = ?");
      stmt.setInt(1, productID);
      stmt.executeUpdate();
    }
}
