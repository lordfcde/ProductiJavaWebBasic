<%-- 
    Document   : categories
    Created on : Feb 26, 2026, 10:54:41 AM
    Author     : vinhh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>Accounts</title>
    </head>
    <body>
        <%@include file ="menu.jspf" %>
        <h1>Accounts list</h1>
        <div class="table-responsive">          
            <table class="table">
                <thead>
                    <tr>
                        <th>Account</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Birthday</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>Is Use</th>
                        <th>role in system</th>
                        <th>Action</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" items="${requestScope.danhsachACC}">
                        <tr>
                            <td>${i.account}</td>
                            <td>${i.pass}</td>
                            <td>${i.lastName} ${i.firstName}</td>
                            <td><fmt:formatDate value ="${i.birthday}" pattern="dd/MM/yyyy"></fmt:formatDate></td>
                            <td>${i.gender ? "Male": "Female"}</td>
                            <td>${i.phone}</td>
                            <td>${i.isUse ? "Active" : "Locked"}</td>
                            <td>${i.roleInSystem == 1 ? "Admin" : "User"}</td>
                            <td>

                                <a href="MainController?action=updaccs&acc=${i.account}" class="btn btn-primary">Update                                                                    
                                </a>

                                <a href="MainController?action=xoaaccs&acc=${i.account}" class="btn btn-danger" onclick="return confirm('Are you sure to delete')">
                                    Delete</a>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
