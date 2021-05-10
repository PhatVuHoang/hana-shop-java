<%-- 
    Document   : manage
    Created on : Jan 18, 2021, 8:59:37 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
        <style>
            .welcome{
                font-family: 'Roboto', sans-serif;
                padding-left: 18px;
                margin-bottom: 1rem;
            }
            span{
                font-weight: bold;
                color: orange;
            }
            p{
                margin-bottom: 0;
            }
        </style>
        <title>Manage Page</title>
    </head>
    <body>
        <c:if test="${not empty sessionScope.ADMIN}">
            <nav class="navbar navbar-dark bg-dark">
                <a class="navbar-brand">Manage Hana Shop</a>
                <form class="form-inline" action="Dispatcher">
                    <select class="form-control mr-sm-2" name="cbCate">
                        <option>Category</option>
                        <c:forEach var="category" items="${sessionScope.LISTCATE}">
                            <option <c:if test="${category eq sessionScope.NAMECATEMANAGE}">selected</c:if>>${category}</option>
                        </c:forEach>
                    </select>
                    <input class="form-control mr-sm-2" name="txtSearchManage" type="search" placeholder="Search" aria-label="Search" value="${sessionScope.SEARCHVALUEMANAGE}">
                    <input class="form-control mr-sm-2" type="number" name="txtMin" value="${sessionScope.MINMANAGE}" placeholder="Min"/>
                    <input class="form-control mr-sm-2" type="number" name="txtMax" min="${param.txtMin}" value="${sessionScope.MAXMANAGE}" placeholder="Max"/>
                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="SearchManage" name="btAction" />
                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Add Item" name="btAction" />
                </form>
            </nav>
            <div class="welcome">
                <p>welcome,<span>${sessionScope.FULLNAME}</span></p><a href="Dispatcher?btAction=Logout">Logout</a>

            </div>
            <div class="product">
                <a href="main.jsp">BACK</a><br/>
                <font color="red">${requestScope.ERRORDATE.invalidDateErr}</font>
                <table border="1">
                    <thead>
                        <tr class="text-center">
                            <th>ID</th>
                            <th>IMAGE</th>
                            <!--<th>LINK IMAGE</th>-->
                            <th>NAME</th>
                            <th>DESCRIPTION</th>
                            <th>PRICE</th>
                            <th>QUANTITY</th>
                            <th>CREATE DATE</th>
                            <th>INVALID DATE</th>
                            <th>NAME CATEGORY</th>
                            <th>STATUS</th>
                    <form action="Dispatcher" method="POST">
                        <th>
                            <input type="submit" onclick="return confirm('Are you sure?')" value="Delete" name="btAction" />
                            <input type="hidden" id="txtremove" name="txtremove" value="" />
                        </th>
                    </form>
                    <th>Update</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${sessionScope.LISTPRODUCTMANAGE}" varStatus="counter">
                        <form action="Dispatcher" method="POST" enctype="multipart/form-data">
                            <input type="hidden" id="proID[${counter.count}]" value="${dto.productID}" />
                            <tr>
                                <td>
                                    ${dto.productID}
                                    <input type="hidden" name="txtProID" value="${dto.productID}" />
                                </td>
                                <td>
                                    <input type="file" name="txtImage" value="${dto.imageProduct}"/>
                                    <input type="hidden" name="txtImageTmp" value="${dto.imageProduct}"/>
                                    <image width="50px" height="50px" src="${dto.imageProduct}"/>
                                    <input  id='${counter.count}hidden'type="hidden"  name='img' value="${dto.imageProduct}"/>
                                </td>
                                <%--<td> <input type="text"  required value="${dto.imageProduct}" /></td>--%>
                                <td><input type="text" name="txtproductName" required value="${dto.productName}" /></td>
                                <td><input type="text" name="txtDescription" required value="${dto.description}" /></td>
                                <td><input type="number" min="1" name="txtPrice" required value="${dto.price}"/></td>
                                <td><input type="number" min="1" name="txtQuantity" required value="${dto.quantity}"/></td>
                                <td>
                                    ${dto.createDate}
                                    <input type="hidden" name="txtCreateDate" value="${dto.createDate}" />
                                </td>
                                <td> <input type="date" name="txtInvalidDate" required value="${dto.invalidDate}"/> </td>
                                <td>
                                    <select name="cbNameCate">
                                        <c:forEach var="catename" items="${sessionScope.LISTCATE}">
                                            <option <c:if test="${catename eq dto.nameCategory}">selected</c:if> >${catename}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <select name="cbStatus">
                                        <option <c:if test="${dto.status eq true}">selected</c:if>>True</option>
                                        <option <c:if test="${dto.status eq false}">selected</c:if>>False</option>
                                        </select>
                                    </td>
                                    <td class="text-center">
                                        <input type="checkbox" name="chkDelete" onclick="remove(${counter.count})" />
                                </td>
                                <td>
                                    <input type="submit" value="Update Item" name="btAction"/>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="shop__last__option">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="shop__pagination">
                            <c:if test="${sessionScope.COUNTMANAGE > 1}">
                                <c:forEach var="page" begin="1" end="${sessionScope.COUNTMANAGE}">
                                    <a href="Dispatcher?btAction=SearchManage&txtSearchManage=${param.txtSearchManage}&cbCate=${sessionScope.NAMECATEMANAGE}&txtMin=${sessionScope.MINMANAGE}&txtMax=${sessionScope.MAXMANAGE}&page=${page}">
                                        ${page}
                                    </a>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty sessionScope.ADMIN}">
            <c:import url="InvalidPage.jsp"/>
        </c:if>
        <script>
            function remove(index) {
                var string = document.getElementById('txtremove').value;
                document.getElementById('txtremove').value = string + document.getElementById('proID[' + index + ']').value + ';';
                console.log(document.getElementById('txtremove').value);
            }
//            function change(id){
//                var file=document.getElementById(id).value;
//                var hidden=document.getElementById(id+'hidden').value;
//                hidden=file;
//                var img=document.getElementById(id+'img');
//                img.src=hidden;
//                console.log('hidden',hidden);
//            }
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>
