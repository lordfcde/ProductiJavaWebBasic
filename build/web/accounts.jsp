<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Account Management</title>
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
            <h2 class="text-primary"><span class="glyphicon glyphicon-user"></span> Accounts Dashboard</h2>
            <hr>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="bg-primary" style="color: white;">
                        <tr>
                            <th>Account</th>
                            <th>Password</th>
                            <th>Name</th>
                            <th>Birthday</th>
                            <th>Gender</th>
                            <th>Phone</th>
                            <th class="text-center">Role</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="i" items="${requestScope.danhsachACC}">
                            <tr>
                                <td><strong>${i.account}</strong></td>
                                <td>${i.pass}</td>
                                <td>${i.lastName} ${i.firstName}</td>
                                <td><fmt:formatDate value="${i.birthday}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                                <td>${i.gender ? "Male": "Female"}</td>
                                <td>${i.phone}</td>
                                <td class="text-center">
                                    <span class="label label-info">${i.roleInSystem == 1 ? "Admin" : "User"}</span>
                                </td>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${i.isUse}">
                                            <span class="label label-success">Active</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="label label-danger">Deactive</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="text-center">
                                    <a href="MainController?action=updaccs&acc=${i.account}" class="btn btn-warning btn-sm">
                                        <span class="glyphicon glyphicon-edit"></span> Edit
                                    </a>
                                    <a href="MainController?action=xoaaccs&acc=${i.account}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this account?')">
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