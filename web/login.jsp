<%-- 
    Document   : login
    Created on : Mar 6, 2022, 6:40:45 PM
    Author     : ThienPN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginPage</title>

    </head>
    <body style="font-size: 20px; margin-top: 5%;">

        <h2 style="text-align: center;">WellCome to Vegatable Store</h2>
        <div id="fb-root"></div>
        <form action="LoginController" method="POST" id="form"  style="text-align: center;">
             <i>User ID </i><input style="width: 150px; margin-left: 1%;" type="text" name="userID"></br>
            <i>Password</i><input style="width: 150px; margin-top: 5px; margin-left: 0.4%" type="password" name="password"></br>
            <input style="margin-top: 1%; border-radius: 1%;" type="submit" name="action" value="Login"/>
            <div id="error"></div>
            <div class="g-recaptcha" data-sitekey="6LdMPMMeAAAAAH00GpRF0xho238kI6ormDOa9KVq" style="margin-left: 40%; margin-top:2%; margin-bottom: 2%; "></div>
        </form>
        <form action="MainController" method="POST" style="text-align: center;">
                <input style="pading-top: 1%; border-radius: 1%; " type="submit" name="action" value="Create"/>
        </form>
        
        
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <div style="text-align: center; margin-top: 2%;">
            <%= error%>
        </div>



        
       
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function (){
            let isvalid = false;
                    const form = document.getElementById("form");
                    const error = document.getElementById("error");
                    form.addEventListener("submit", function(event){
                    event.preventDefault();
                            const response = grecaptcha.getResponse();
                    if (response){
                    form.submit();
                    } else {
                        error.innerHTML = "Please check Captcha before Login";
                    }
                    });
                    }
        </script>
        <script>
            
        </script>
    </body>
</html>
