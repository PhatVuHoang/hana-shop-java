<%-- 
    Document   : history
    Created on : Jan 18, 2021, 9:48:15 AM
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
        <title>History | Page</title>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
        <style>
            .box__search{
                margin: 20px 0;
                padding-left: 300px;
            }
            h2{
                padding-left: 380px;
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
                                        <li><a href="Dispatcher?btAction=search&txtSearch=&cbCate=Category&txtMin=1&txtMax=1000&index=1">Shop</a></li>
                                        <li class="active"><a href="Dispatcher?btAction=History">History</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </header>
                <div class="container">
                    <nav class="box__search">
                        <form class="form-inline" action="Dispatcher">
                            <input type="radio" name="radio" value="1" <c:if test="${sessionScope.SELECT eq 1}">checked</c:if> onclick="myFunction()"/>
                            <input class="form-control mr-sm-2" id="input1" <c:if test="${sessionScope.SELECT eq 2}">disabled</c:if> required placeholder="Order date" type="date" name="txtDateHistory" value="${sessionScope.SEARCHDATEHISTORY}" />
                            <input type="radio" name="radio" value="2" <c:if test="${sessionScope.SELECT eq 2}">checked</c:if> onclick="myFunction1()"/>
                            <input class="form-control mr-sm-2" id="input2" <c:if test="${sessionScope.SELECT eq 1}">disabled</c:if> required name="txtSearchHistory" type="search" placeholder="Search" aria-label="Search" value="${sessionScope.SEARCHVALUEHISTORY}">
                            <input class="btn btn-outline-success my-2 my-sm-0" name="btAction" type="submit" value="searchHistory" />
                        </form>
                    </nav>
                    <section class="content__history ">
                        <c:if test="${not empty sessionScope.LISTINVOICE}">
                            <table class="container" border="1">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Product name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Date order</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="dto" items="${sessionScope.LISTINVOICE}" varStatus="counter">
                                        <tr>
                                            <td>${counter.count}</td>
                                            <td>${dto.productName}</td>
                                            <td>${dto.quantity}</td>
                                            <td>${dto.price}</td>
                                            <td>${dto.dateOrder}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${empty sessionScope.LISTINVOICE}">
                            <h2>You have no invoice :(</h2>
                        </c:if>
                    </section>
                </div>
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
        <script>
                                                            function myFunction() {
                                                                document.getElementById('input2').disabled = true;
                                                                document.getElementById('input1').disabled = false;
                                                            }
                                                            function myFunction1() {
                                                                document.getElementById('input1').disabled = true;
                                                                document.getElementById('input2').disabled = false;
                                                            }
        </script>
    </body>
</html>
