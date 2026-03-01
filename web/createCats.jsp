<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Create Category</title>
    </head>
    <body>
        <%@include file="menu.jspf" %>
        <div class="container">
            <h1>Add New Category</h1>
            <hr>
            <form class="form-horizontal" action="MainController?action=createcat" method="post">             
                <div class="form-group">
                    <label class="control-label col-sm-2">Category Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="catName" placeholder="Example : Tech" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Memo:</label>
                    <div class="col-sm-10">
                        <input type ="text" class="form-control" name="memo" placeholder="Please Type">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success btn-lg">Save Category</button>
                    </div>
                </div>
            </form>
            <c:if test="${not empty errmsg}">
                <div class="alert alert-warning">
                    <strong>Warning! </strong>${errmsg}
                </div>
            </c:if>

        </div>
    </body>
</html>