<%-- 
    Document   : categories
    Created on : Feb 26, 2026, 10:54:41 AM
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
        <title>Categories</title>
    </head>
    <body>
        <%@include file ="menu.jspf" %>
        <h1>Categories list</h1>
        <div class="table-responsive">          
            <table class="table">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Category Name</th>
                        <th>Memo</th>
                        <th>Action</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" items="${requestScope.danhsachCats}">
                        <tr>
                            <td>${i.typeId}</td>
                            <td>${i.categoryName}</td>
                            <td>${i.memo}</td>
                            <td>

                                <a href="MainController?action=updcats&id=${i.typeId}" class="btn btn-primary">Update                                                                    
                                </a>

                                <a href="MainController?action=xoacats&id=${i.typeId}" class="btn btn-danger" onclick="return confirm('Are you sure to delete')">
                                    Delete</a>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
