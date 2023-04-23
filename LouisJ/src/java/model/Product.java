/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author KX
 */

public class Product {
    private int productID;
    private byte[] image;
    private String name;
    private String description;
    private double price;

    public int getProductID() {
      return productID;
    }

    public void setProductID(int productID) {
      this.productID = productID;
    }

    public byte[] getImage() {
      return image;
    }

    public void setImage(byte[] image) {
      this.image = image;
    }

    public String getName() {
      return name;
    }

    public void setName(String name) {
      this.name = name;
    }

    public String getDescription() {
      return description;
    }

    public void setDescription(String description) {
      this.description = description;
    }

    public double getPrice() {
      return price;
    }

    public void setPrice(double price) {
      this.price = price;
    }
}
