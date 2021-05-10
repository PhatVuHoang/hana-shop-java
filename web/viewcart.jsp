<%-- 
    Document   : viewcart
    Created on : Jan 14, 2021, 6:55:59 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Cake Template">
        <meta name="keywords" content="Cake, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>View Cart | Page</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/barfiller.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" integrity="sha512-rqQltXRuHxtPWhktpAZxLHUVJ3Eombn3hvk9PHjV/N5DMUYnzKPC1i3ub0mEXgFzsaZNeJcoE0YHq0j/GFsdGg==" crossorigin="anonymous" />
        <style>
            .table-viewCart{
                text-align: center;
                margin: 70px 0;
            }
            table{
                width: 70%;

            }
            img{
                width: 50px;
                height: 50px;
            }
            td{
                width: 50px;
            }
            button{
                height: 30px;
                border: 1px solid #f08632;
                background-color: white;
                transition: .5s
            }
            button:hover{
                background-color: #f08632;
                color: white;
                border: 1px solid white;
                transition: .5s
            }
            .button{
                height: 30px;
                border: 1px solid #f08632;
                background-color: white;
                transition: .5s
            }
            .button:hover{
                background-color: #f08632;
                color: white;
                border: 1px solid white;
                transition: .5s
            }
        </style>
    </head>
    <body>
        <c:if test="${not empty sessionScope.FULLNAME}"> 
            <c:if test="${empty sessionScope.ADMIN}">
                <header class="header">
                    <div class="header__top">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="header__top__inner">
                                        <div class="header__top__left">
                                            <c:if test="${not empty sessionScope.FULLNAME}">
                                                <ul>
                                                    <li>Welcome, ${sessionScope.FULLNAME}</li>
                                                </ul>
                                            </c:if>
                                        </div>
                                        <div class="header__logo">
                                            <a href="#"><img style="width: 80px; height: 80px;" src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/3e27b915-f803-4e3f-bf8b-478b3548e3e5_200x200.png?alt=media&token=62252a05-1de4-4cc8-9a50-762348cf7b7b" alt=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="canvas__open"><i class="fa fa-bars"></i></div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <nav class="header__menu mobile-menu">
                                    <ul>
                                        <li><a href="Dispatcher?btAction=Home">Home</a></li>
                                        <li class="active"><a href="SearchServlet">Shop</a></li>
                                            <c:if test="${not empty sessionScope.FULLNAME}">
                                            <li><a href="SearchHistoryServlet">History</a></li>
                                            </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </header>
                <a href="Dispatcher?btAction=search&txtSearch=${sessionScope.SEARCHVALUE}&cbCate=${sessionScope.NAMECATE}&txtMin=${sessionScope.MIN}&txtMax=${sessionScope.MAX}"><i class="fa fa-angle-left"></i> BACK</a>
                <div class="table-viewCart">
                    <c:if test="${not empty sessionScope}">
                        <c:if test="${not empty sessionScope.CUSTCART}">
                            <c:if test="${not empty sessionScope.LISTITEM}">
                                ${requestScope.ERROR}
                                <table style="margin-left: 220px; " border="1">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Image</th>
                                            <th>Name</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="list" items="${sessionScope.LISTITEM}" varStatus="counter">
                                        <form action="Dispatcher" method="POST">
                                            <tr>
                                                <td>
                                                    ${counter.count}
                                                    <input type="hidden" name="IdDelete" value="${list.key}" />
                                                </td>
                                                <c:forEach var="dto" items="${sessionScope.ALLPRODUCT}">
                                                    <c:if test="${list.key eq dto.productID}">
                                                        <td><img src="${dto.imageProduct}"/></td>
                                                        <td>${dto.productName}</td>
                                                        <td> 
                                                            <input type="hidden" name="txtID" value="${list.key}" />
                                                            <input style="width: 50px;" type="number" name="quantityview" min="1" max="${dto.quantity}" value="${list.value}"/> 
                                                            <button name="btAction" value="Update quantity">Update</button>
                                                        </td>
                                                        <td>$${list.value*dto.price}</td>
                                                        <c:set var="total" value="${total + list.value * dto.price}"/>
                                                    </c:if>
                                                </c:forEach>
                                                <td>
                                                    <input type="submit" class="button" onclick="return confirm('Are you sure?')"  value="Delete Item" name="btAction" />
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    <td colspan="6">Total: $${total}</td>
                                    </tbody>
                                </table>

                            </div>
                            <form action="Dispatcher" method="POST">
                                <div class="content-info container">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Full name</label>
                                            <input type="text" class="form-control" id="inputEmail4" readonly name="fullname" value="${sessionScope.FULLNAME}">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Phone</label>
                                            <input type="tel" class="form-control" id="inputPassword4" pattern="[0-9]{10}" placeholder="0987654321" name="phone" value="${sessionScope.PHONE}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAddress">Email</label>
                                        <input type="email" class="form-control" id="inputAddress" placeholder="abc@gmail.com" name="email" value="${sessionScope.EMAIL}">
                                    </div>
                                    <div class="form-group">
                                        <font color="red">${requestScope.EMPTY}</font><br/>
                                        <label for="inputAddress">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" name="address" placeholder="1234 Main St">
                                    </div>
                                    <input type="submit" style="height: 50px; width: 100%;" class="button" value="Check out" name="btAction" />
                                </div>
                            </form>
                        </c:if>
                        <c:if test="${empty sessionScope.LISTITEM}">
                            <h2>No items in your cart</h2>
                        </c:if>
                    </c:if>
                    <c:if test="${empty sessionScope.CUSTCART}">
                        <h2>No items in your cart</h2>
                    </c:if>
                </c:if>
                <c:if test="${empty sessionScope}">
                    <h2>No items in your cart</h2>
                </c:if>
            </c:if>
            <c:if test="${not empty sessionScope.ADMIN}">
                <c:import url="InvalidPage.jsp"/>
            </c:if>
        </c:if>
        <c:if test="${empty sessionScope.FULLNAME}">
            <c:import url="InvalidPage.jsp"/>
        </c:if>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.barfiller.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
