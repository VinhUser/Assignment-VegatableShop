<%-- 
    Document   : searchuser
    Created on : Mar 9, 2022, 6:20:54 PM
    Author     : ThienPN
--%>

<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search User Page</title>
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
            Welcome: <b><%= loginUser.getFullName()%></b>
            <form action="MainController" style="margin-top: 1%;">
                Search User Information <input style="margin-left: 1%;" type="text" name="search" value="<%= search%>"/>
                <input type="submit" name="action" value="Search"/>
            </form>
            <%
                List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
                if (listUser != null) {
                    if (listUser.size() > 0) {
            %>
            <table border="1" style="text-align: center; margin-left: auto;margin-right: auto; margin-top: 2%;">
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Password</th>
                        <th>Role ID</th>
                        <th>Address</th>
                        <th>Birthday</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (UserDTO user : listUser) {
                    %>
                <form action="MainController" style="text-align: center;">
                    <tr style="text-align: center;">
                        <td><%= count++%></td>
                        <td>
                            <input type="text" name="userID" value="<%= user.getUserID()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                        </td>
                        
                        <td>
                            <%= user.getPassword()%>
                        </td>
                        <td>
                            <input type="text" name="address" value="<%= user.getAddress()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="birthday" value="<%= user.getBirthday()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="phone" value="<%= user.getPhone()%>" required=""/>
                        </td>
                        <td>
                            <input type="text" name="email" value="<%= user.getEmail()%>" required=""/>
                        </td>
                         <td>
                            <input type="text" name="status" value="<%= user.getStatus()%>" required=""/>
                        </td>
                        

                        <td>    
                            <a style="text-decoration: none; color: red;"href="MainController?action=Deleteu&userID=<%= user.getUserID()%>">Delete</a> </td>
                        <td>
                            <input type="hidden" name="search" value="<%= search%>"/>
                            <input type="submit" name="action" value="Updatep"/>
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
                <a href="MainController?action=Searchp&searchp=" style="text-decoration: none; color: black; font-size: 30px;"><b>Search Product<b></a>
            </div>
        
    </body>
</html>
