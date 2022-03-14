<%-- 
    Document   : create
    Created on : Mar 7, 2022, 12:23:32 PM
    Author     : ThienPN
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User Page</title>
    </head>
    <body>  
        <h1 style="text-align: center;">Input your information:</h1>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();            }
        %>  
        <form action="MainController" method="POST" style="text-align: center;">
            User ID   <input style="margin-left: 3.4%; " type="text" name="userID" required=""/></br>
            </br><%= userError.getUserIDError() %></br>
            Full Name <input style="margin-left: 2.55%; margin-top: 1%;" type="text" name="fullName" required=""/><br>
            </br><%= userError.getFullNameError() %></br>
            Role ID   <input style="margin-left: 3.4%; margin-top: 1%; " type="text" name="roleID" value="US" readonly=""/></br>
            Password  <input style="margin-left: 2.9%; margin-top: 1%;" type="password" name="password" required=""/></br>
            Address   <input style="margin-left: 3.3%; margin-top: 1%;" type="text" name="address" required=""/></br>
            Birthday  <input style="margin-left: 3.15%; margin-top: 1%;" type="date" name="birthday" required=""/></br>
            Phone     <input style="margin-left: 3.9%; margin-top: 1%;" type="text" name="phone" required=""/></br>
            Email     <input style="margin-left: 4%; margin-top: 1%;" type="text" name="email" required=""/><br>
            </br><%= userError.getEmailError()%></br>
            Status    <input style="margin-left: 4%; margin-top: 1%;" type="text" name="status" value="1" readonly=""/></br>
            Confirm   <input style="margin-left: 3.2%; margin-top: 1%;" type="password" name="confirm" required=""/>
            <%= userError.getConfirmError() %></br>
            <input style="margin-top: 1%; margin-right: 2%;" type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>
        </form>
    </body>
</html>
