<%-- 
    Document   : Login
    Created on : Feb 27, 2026, 11:34:38 AM
    Author     : vinhh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="jumbotron">
                <h1 class= "text-center">Welcome to Product Information</h1>      
                <p class= "text-center" >Please login to get Product </p>
                <img src="images/img_avatar1.png" class="img-rounded center-block"  alt="Cinque Terre">

            </div>

        </div>
        <br><!-- comment -->

        <div style="max-width: 900px; margin: 0 auto;">
            <form action="MainController?action=login" method="post">
                <div class="form-group">
                    <label for="usr" >Username</label>
                    <input type=text class="form-control" id="usr" name="uname" required>
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd" name="pwd" required>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox"> Remember me</label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
        
        <c:if test="${not empty errmsg}">
             <div class="alert alert-warning">
            <strong>Warning!</strong>${errmsg}
        </div>
        </c:if>

     

   

</body>
</html>
