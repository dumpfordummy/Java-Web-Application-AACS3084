<%-- 
    Document   : addProduct
    Created on : Mar 19, 2023, 11:15:08 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <h1>Add Product</h1>
        <form method="POST" action="addProduct">
            <label for="name">Name:</label>
            <input type="text" name="name"><br>
            <label for="description">Description:</label>
            <input type="text" name="description"><br>
            <label for="category">Category</label>
            <input type="text" name="category"><br>
            <label for="price">Price:</label>
            <input type="number" step="0.01" name="price"><br>
            <label for="image">Select image:</label>
            <input type="file" name="image">
            <input type="submit" value="Add Product">
            <input type="reset" value="Reset">
        </form>
    </body>
</html>
