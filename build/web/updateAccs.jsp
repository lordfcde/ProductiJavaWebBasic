
<%-- 
    Document   : updateACCs
    Created on : Feb 27, 2026, 10:51:48 PM
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
        <title>Update Account</title>
    </head>
    <%@include file="menu.jspf" %>
    <body>
        <h1>Update your Account</h1>
        <form class="form-horizontal" action="MainController?action=updaccs" method="post">

            <div class="form-group">
                <label class="control-label col-sm-2" for="id">Account</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="${acc.account}" id="id" name="id" readonly>
                </div>
            </div>            
            <div class="form-group">
                <label class="control-label col-sm-2" for="accpwd">Password</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" value="${acc.pass}" id="accpwd" placeholder="Enter Password" name="accpwd" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="accLastName">Last Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="accLastName" value="${acc.lastName}" placeholder="Enter Last Name" name="accLastName">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="accFirstName">First Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="accFirstName" value="${acc.firstName}" placeholder="Enter First Name" name="accFirstName">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="accBirth">Birthday</label>
                <div class="col-sm-10">
                    <input type="date" 
                           class="form-control" 
                           id="accBirth" 
                           name="accBirth" 
                           value="<fmt:formatDate value='${acc.birthday}' pattern='yyyy-MM-dd' />"> 
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Gender:</label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                        <input type="radio" name="accGender" value="true" ${acc.gender ? 'checked' : ''}> Nam
                    </label>

                    <label class="radio-inline">
                        <input type="radio" name="accGender" value="false" ${!acc.gender ? 'checked' : ''}> Nữ
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="accPhone">Phone</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="accPhone" value="${acc.phone}" placeholder="Enter Phone" name="accPhone">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Role in system:</label>
                <div class="col-sm-10">
                    <select  class="form-control" name="accRole">
                        <option value ="1" ${acc.roleInSystem == 1 ? 'selected':''}>Admin</option>
                        <option value="2" ${acc.roleInSystem ==2 ? 'selected' : ''}>User/Manager</option>
                    </select>



                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Save</button>
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
