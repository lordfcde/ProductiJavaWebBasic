<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Add New Product</title>
    </head>
    <body>
        <%@include file="menu.jspf" %>
        <div class="container">
            <h1>Add New Product</h1>
            <hr>


            <form class="form-horizontal" action="MainController?action=createprod" method="post">

                <div class="form-group">
                    <label class="control-label col-sm-2">Product ID:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="txtId" placeholder="VD: IPHONE15" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="txtName" placeholder="VD: iPhone 15 Pro Max" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2">Price (VND):</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="txtPrice" placeholder="VD: 25000000" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2">Unit:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="txtUnit" placeholder="VD: Cái, Chiếc...">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2">Category:</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="txtType" required>
                            <option value="" disabled selected>--- Vui lòng chọn Danh mục ---</option>
                            <c:forEach var="cat" items="${requestScope.listCats}">
                                <option value="${cat.typeId}">${cat.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2">Image Path:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="txtImage" placeholder="VD: /images/sanPham/iphone.jpg">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success btn-lg">Save Product</button>
                        <a href="MainController?action=listprods" class="btn btn-default btn-lg">Cancel</a>
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