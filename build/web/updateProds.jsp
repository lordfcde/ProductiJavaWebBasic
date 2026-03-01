<%-- 
    Document   : updateProds
    Created on : Mar 1, 2026, 2:49:54 PM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Update Product</title>
    </head>
    
    <body>
        <%@include file="menu.jspf" %>
        
        <div class="container">
            <h1>Update Product Information</h1>
            <hr>
            
          
            <form class="form-horizontal" action="MainController?action=updateprod" method="post">

             
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtId">Product ID</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${i.productId}" id="txtId" name="txtId" readonly>
                    </div>
                </div>             

              
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtName">Product Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${i.productName}" id="txtName" placeholder="Enter Product Name" name="txtName" required>
                    </div>
                </div>

             
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtPrice">Price (VND)</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="txtPrice" value="${i.price}" placeholder="Enter Price" name="txtPrice" required>
                    </div>
                </div>

              
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtUnit">Unit</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="txtUnit" value="${i.unit}" placeholder="Enter Unit (e.g. Cái, Chiếc...)" name="txtUnit">
                    </div>
                </div>

                
                <div class="form-group">
                    <label class="control-label col-sm-2">Category:</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="txtType">
                            <c:forEach var="cat" items="${requestScope.listCats}">
                                <%-- So khớp ID của sản phẩm với ID trong list danh mục để chọn sẵn (selected) --%>
                                <option value="${cat.typeId}" ${cat.typeId == i.typeId.typeId ? 'selected' : ''}>
                                    ${cat.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

            
                <div class="form-group">
                    <label class="control-label col-sm-2" for="txtImage">Image Path</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="txtImage" value="${i.productImage}" placeholder="Enter image path (e.g. /images/iphone.jpg)" name="txtImage">
                    </div>
                </div>

             
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Save changes</button>
                        <a href="MainController?action=listprods" class="btn btn-link">Cancel</a>
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