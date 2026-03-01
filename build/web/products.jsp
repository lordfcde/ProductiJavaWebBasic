<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Product Management</title>
        <style>
            /* Custom CSS to keep the table neat */
            .table > tbody > tr > td,
            .table > tbody > tr > th,
            .table > thead > tr > th {
                vertical-align: middle; /* Centers text vertically with the image */
            }
            .product-img {
                width: 80px;
                height: 80px;
                object-fit: cover; /* Ensures images don't stretch */
            }
        </style>
    </head>
    <body>
        <%@include file="menu.jspf" %>
        <div class="container">
            <h2 class="text-primary"><span class="glyphicon glyphicon-list-alt"></span> Inventory Dashboard</h2>
            <hr>
            <div class="table-responsive">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="bg-primary" style="color: white;">
                        <tr>
                            <th class="text-center">Image</th>
                            <th>ID</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Unit</th>                   
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="i" items="${requestScope.danhsachProds}">
                            <tr>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${not empty i.productImage}">                                  
                                            <img src="${pageContext.request.contextPath}${i.productImage}" 
                                                 alt="${i.productName}" 
                                                 class="img-thumbnail product-img">
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted small">No Image</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${i.productId}</td>
                                <td><strong>${i.productName}</strong></td>
                                <td><span class="label label-info">${i.typeId.categoryName}</span></td>
                                <td>
                                    <fmt:formatNumber value="${i.price}" type="currency" currencySymbol="VND " />
                                </td>
                                <td>${i.unit}</td>
                                <c:if test="${sessionScope.USER.roleInSystem == 1}">
                                <td class="text-center">
                                    <a href="MainController?action=updprods&id=${i.productId}" class="btn btn-warning btn-sm">
                                        <span class="glyphicon glyphicon-edit"></span> Edit
                                    </a>
                               
                                    <a href="MainController?action=xoaprods&id=${i.productId}" class="btn btn-danger btn-sm" 
                                       onclick="return confirm('Are u sure u want to del')">
                                        <span class="glyphicon glyphicon-trash"></span> Delete
                                    </a>
                                </td></c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>