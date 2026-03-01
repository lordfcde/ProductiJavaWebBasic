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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Category Management</title>
        <style>
            .table > tbody > tr > td,
            .table > tbody > tr > th,
            .table > thead > tr > th {
                vertical-align: middle;
            }
        </style>
    </head>
    <body>
        <%@include file ="menu.jspf" %>
        <div class="container">
            <h2 class="text-primary"><span class="glyphicon glyphicon-tags"></span> Categories Dashboard</h2>
            <hr>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="bg-primary" style="color: white;">
                        <tr>
                            <th>ID</th>
                            <th>Category Name</th>
                            <th>Memo</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="i" items="${requestScope.danhsachCats}">
                            <tr>
                                <td><strong>${i.typeId}</strong></td>
                                <td>${i.categoryName}</td>
                                <td>${i.memo}</td>
                                <td class="text-center">
                                    <a href="MainController?action=updcats&id=${i.typeId}" class="btn btn-warning btn-sm">
                                        <span class="glyphicon glyphicon-edit"></span> Edit
                                    </a>
                                    <a href="MainController?action=xoacats&id=${i.typeId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this category?')">
                                        <span class="glyphicon glyphicon-trash"></span> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>