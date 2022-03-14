<%-- 
    Document   : admin
    Created on : Mar 6, 2022, 6:42:18 PM
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
        <title>Admin Page</title>
    </head>
    
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
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>
            Welcome: <b><%= loginUser.getFullName()%></b></br>
            <div style="margin-top: 2%;">
            <a href="MainController?action=Search&search="style="text-decoration: none; color: black; font-size: 30px;"><b>Search User</b></a>
            <a href="MainController?action=Searchp&searchp="style="text-decoration: none; color: black; margin-left: 3%; font-size: 30px;"><b>Search Product</b></a>
            </div>
            
        
    </body>
</html>
