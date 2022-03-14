<%-- 
    Document   : user
    Created on : Mar 6, 2022, 9:38:14 PM
    Author     : ThienPN
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body style="text-align: center;">
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <div style="margin-top: 0.5%; float: right; float: top; font-size: 20px; margin-right: 2%;">
            <form action="MainController" method="P0ST">
                Wellcome : <b><a href="userprofile.jsp" style="color: black; text-decoration: none;"><%= loginUser.getFullName()%></a><b></br>
                        <input style="margin-top: 0.5%; float: right; float: top; color: red;font-size: 20px; margin-right: 2%;" type="submit" name="action" value="Logout"/>
                        </form>
                        </div>
                        <div style="text-align: center; margin-left: 15%;">
                            <h1 style="width:100%;font-size: 50px;">Vegatable Store</h1>
                        </div>
                        <div style="margin-left:5% ; margin-right: 5%; margin-top: 3%;">
                            <img style="width: 23%; height: 30%;" src="img/ca_rot_vi_thuoc_chua_2.jpg"/>
                            <img style="width: 23%; height: 30%;" src="img/cach-an-khoai-tay-tot-cho-he-tieu-hoa.jpg"/>
                            <img style="width: 23%; height: 30%;" src="img/khoalang.jpg"/>
                            <img style="width: 23%; height: 30%;" src="img/xa-lach-3679.jpg"/>
                        </div>
                        <div style="margin-left:5% ; margin-right: 5%; margin-top: 4%;">
                            <img style="width: 23%; height: 30%;" src="img/ca-chua.jpg"/>
                            <img style="width: 23%; height: 30%;" src="img/du-du-giup-vong-1-tro-nen-quyen-ru-1.jpg"/>
                            <img style="width: 23%; height: 30%;" src="img/ca4_21112299.jpg"/>
                            <img style="width: 23%; height: 30%;" src="img/bi-xanh-tui-1kg-202011092052402369.jpg"/>
                        </div>        


                        </body>
                        </html>
