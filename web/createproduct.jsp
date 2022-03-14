<%-- 
    Document   : createproduct
    Created on : Mar 10, 2022, 1:25:43 PM
    Author     : ThienPN
--%>

<%@page import="java.sql.Date"%>
<%@page import="sample.product.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product Page</title>
    </head>
    <body>
        <div style="">
            <a href="MainController?action=Search&search="style="text-decoration: none; color: black; font-size: 30px;"><b>Search User</b></a>
            <a href="MainController?action=Searchp&searchp="style="text-decoration: none; color: black; margin-left: 3%; font-size: 30px;"><b>Search Product</b></a>
            </div>
        <h1 style="text-align: center;">Create New Product</h1>
        <%
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
        %>
        <form action="MainController" method="POST" style="text-align: center;">
            Product ID<input style="margin-left: 3.2%;" type="text" name="productID" required=""/><br>
            </br><%= productError.getProductIDError() %></br>
            Product Name<input style="margin-left: 2.1%; margin-top: 1%;" type="text" name="productName" required=""/></br>
            Image<input style="margin-left: 4.5%; margin-top: 1%;" type="text" name="image" required=""/></br>
            Price<input style="margin-left: 5%; margin-top: 1%;" type="text" name="price" required=""/>
            </br><%= productError.getPriceError() %></br>
            Quantity<input style="margin-left: 3.9%; margin-top: 1%;" type="text" name="quantity" required=""/>
            </br><%= productError.getQuantityError()%></br>
            Catagory ID<input style="margin-left: 2.7%;margin-top: 1%;" type="text" value="VT" name="catagoryID" readonly=""/></br>
            Import Date<input style="margin-left: 2.8%;margin-top: 1%;" type="date" name="importDate" value="<%= (new Date(System.currentTimeMillis())).toString() %>" readonly=""/></br>
            Using Date<input style="margin-left: 3.1%;margin-top: 1%;" type="date" name="usingDate" required=""/></br>
            </br><%= productError.getUsingDateError()%></br>
            Status<input style="margin-left: 4.7%;margin-top: 1%;" type="text" name="status" value="1" readonly=""/></br>
            <input style="margin-top: 1%; margin-right: 2%;" type="submit" name="action" value="Createp"/>
            <input type="reset" value="Reset"/>
        </form>
    </body>
</html>
