<%-- 
    Document   : additem
    Created on : Jan 19, 2021, 8:15:30 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <title>Add Item | Page</title>
    </head>
    <body>
        <c:if test="${not empty sessionScope.ADMIN}">
            <a href="Dispatcher?btAction=SearchManage&txtSearchManage=&cbCate=Category&txtMin=&txtMax=">< BACK</a>
            <form class="container" action="Dispatcher" method="POST">
                <div class="form-group">
                    <label for="formGroupExampleInput">Name Product</label>
                    <font color="red">${requestScope.ERRORS.nameProductErr}</font>
                    <input type="text" class="form-control" id="formGroupExampleInput" name="txtNameProduct" value="${param.txtNameProduct}">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Image</label>
                    <font color="red">${requestScope.ERRORS.imgProductErr}</font>
                    <input type="text" class="form-control" id="formGroupExampleInput2" name="txtImage" placeholder="link image" value="${param.txtImage}">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Description</label>
                    <font color="red">${requestScope.ERRORS.descriptionErr}</font>
                    <input type="text" class="form-control" id="formGroupExampleInput2" name="txtDescription" value="${param.txtDescription}">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Price</label>
                    <font color="red">${requestScope.ERRORS.priceIsEmpty}</font>
                    <font color="red">${requestScope.ERRORS.priceErr}</font>
                    <input type="number" class="form-control" id="formGroupExampleInput2" name="txtPrice" value="${param.txtPrice}">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Quantity</label>
                    <font color="red">${requestScope.ERRORS.quantityIsEmpty}</font>
                    <font color="red">${requestScope.ERRORS.quantityErr}</font>
                    <input type="number" class="form-control" id="formGroupExampleInput2" name="txtQuantity" value="${param.txtQuantity}">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Create Date</label>
                    <input type="text" class="form-control" id="formGroupExampleInput2" disabled name="txtCreateDate" value="${sessionScope.NOW}">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Invalid Date</label>
                    <font color="red">${requestScope.ERRORS.invalidDateErr}</font>
                    <font color="red">${requestScope.ERRORS.invalidDateEmpty}</font>
                    <input type="date" class="form-control" id="formGroupExampleInput2" name="txtInvalidDate" value="${param.txtInvalidDate}">
                </div>
                <div class="form-group">
                    <label for="formGroupExampleInput2">Category</label>
                    <select name="cbCate">
                        <c:forEach var="cate" items="${sessionScope.LISTCATE}">
                            <option>${cate}</option>
                        </c:forEach>
                    </select>
                </div>
                <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Confirm" name="btAction" />
            </form>
        </c:if>
        <c:if test="${empty sessionScope.ADMIN}">
            <c:import url="InvalidPage.jsp"/>
        </c:if>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
