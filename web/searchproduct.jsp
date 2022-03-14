<%-- 
    Document   : searchproduct
    Created on : Mar 9, 2022, 10:21:30 PM
    Author     : ThienPN
--%>

<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Product Page</title>
    </head>
    <body>
       <body style="width: 100%; height: 100%; display: block; margin: 0; text-align: center;">
            <form action="MainController" method="P0ST">
                <input style="margin-top: 0.5%; float: right; float: top; color: red;font-size: 20px; margin-right: 2%;" type="submit" name="action" value="Logout"/>
            </form>
        <div style="text-align:center; font-size: 20px; height: 80%" >
            <h1 style="text-align: center;padding-top:50px; ">Admin Page</h1>
            <%
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                String searchp = request.getParameter("searchp");
                if (searchp == null) {
                    searchp = "";
                }
            %>
            Welcome: <b><%= loginUser.getFullName()%></b>
            <form action="MainController" style="margin-top: 1%;">
                Search Product Information <input style="margin-left: 1%;" type="text" name="searchp" value="<%= searchp%>"/>
                <input type="submit" name="action" value="Searchp"/>
            </form>
            <%
                List<ProductDTO> listProduct = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
                if (listProduct != null) {
                    if (listProduct.size() > 0) {
            %>
            <table border="1" style="text-align: center; margin-left: auto;margin-right: auto; margin-top: 2%;">
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Catagory ID</th>
                        <th>Import Date</th>
                        <th>Using Date</th>
                        <th>status</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (ProductDTO product : listProduct) {
                    %>
                <form action="MainController" style="text-align: center;">
                    <tr style="text-align: center;">
                        <td ><%= count++%></td>
                        <td>
                            <input type="text" name="productID" value="<%= product.getProductID()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="productName" value="<%= product.getProductName()%>" required=""/>
                        </td>
                        <td>
                            <img style="width: 150px; height: 150px;" src="<%= product.getImage() %>" />
                        </td>
                        <td>
                            <input type="text" name="price" value="<%= product.getPrice()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="quantity" value="<%= product.getQuantity()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="catagoryID" value="<%= product.getCatagoryID()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="importDate" value="<%= product.getImportDate()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="usingDate" value="<%= product.getUsingDate()%>" readonly=""/>
                        </td>
                        <td>
                            <input type="text" name="status" value="<%= product.getStatus()%>" required=""/>
                        </td>
                        

                        <td>    
                            <a style="text-decoration: none; color: red;"href="MainController?action=Delete&productID=<%= product.getProductID()%>">Delete</a> </td>
                        <td>
                            <input type="submit" name="action" value="Update"/>
                            <input type="hidden" name="search" value="<%= searchp%>"/>
                            
                        </td>
                    </tr>
                </form>
                <%
                    }
                %>
                
                </tbody>
            </table>
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
            %>
            <%= error%>
            <%
                    }
                }
            %>
            <div style="margin-top: 2%;">
                <a href="MainController?action=Search&search=" style="margin-top: 2%; text-decoration: none; color: black; font-size: 30px;"><b>Search User</b></a>
                <a href="createproduct.jsp" style="margin-left: 3%; text-decoration: none; color: black; font-size: 30px;"><b>Create Product</b></a>
            </div>
    </body>
</html>
