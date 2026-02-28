<%-- 
    Document   : updateCats
    Created on : Feb 27, 2026, 10:51:48 PM
    Author     : vinhh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>



        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Update Category</title>
    </head>
    <%@include file="menu.jspf" %>
    <body>
        <h1>Update your Category</h1>
        <form class="form-horizontal" action="MainController?action=updcats" method="post">

            <div class="form-group">
                <label class="control-label col-sm-2" for="id">Categories ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="${cat.typeId}" id="id" name="id" readonly>
                </div>
            </div>            
            <div class="form-group">
                <label class="control-label col-sm-2" for="catName">Category Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="${cat.categoryName}" id="catName" placeholder="Enter Category name" name="catName">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="memo">Memo</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="memo" value="${cat.memo}" placeholder="Enter Memo" name="memo">
                </div>
            </div>            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </div>
            <c:if test="${not empty errmsg}">
                <div class="alert alert-warning">
                    <strong>Warning! </strong>${errmsg}
                </div>
            </c:if>
        </form>

    </body>
</html>