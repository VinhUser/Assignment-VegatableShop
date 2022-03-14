<%-- 
    Document   : userprofile
    Created on : Mar 12, 2022, 8:48:37 PM
    Author     : ThienPN
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile Page</title>
    </head>
    <body>
        
        <a href="user.jsp" style="text-decoration: none; color: black; float: left; font-size: 30px;"> Back</a>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div style="text-align: center; margin-top: 1%; font-size: 30px;">
            Wellcome : <%= loginUser.getFullName() %></br>
            UserID : <%= loginUser.getUserID()%></br>
            Password : *****</br>
            RoleID : <%= loginUser.getRoleID()%></br>
            Address : <%= loginUser.getAddress()%></br>
            Birthday : <%= loginUser.getBirthday()%></br>
            Email : <%= loginUser.getEmail()%></br>
            Phone : <%= loginUser.getPhone()%></br>
        </div>
        
    </body>
</html>
