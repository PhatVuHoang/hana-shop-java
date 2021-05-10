<%-- 
    Document   : info
    Created on : Jan 13, 2021, 1:11:02 PM
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
        <title>Info Product | Page</title>

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
            .body-content{
                display: flex;
            }
            .body-left{
                width: 50%;
                /*margin-top: 50px;*/
                margin: 50px 20px;
            }
            .body-right{
                margin: 200px 0;
                width: 50%;
            }
            .back{
                width: 100%;
                margin-left: 20px;
                margin-top: 20px;
                font-size: 20px;
            }
            .back a{
                color: black;
            }
            .back a:hover{
                color: blue;
            }
            .body-content input{
                width: 50px;
            }
            .body-content button{
                width: 200px;
                height: 50px;
                border: 1px solid #f08632;
                background-color: white;
                transition: .5s
            }
            .body-content button:hover{
                background-color: #f08632;
                color: white;
                border: 1px solid white;
                transition: .5s
            }
            form {
                width: 100%;
                display: flex;
            }
        </style>
    </head>
    <body>
        <c:if test="${not empty sessionScope.INFO}"> 
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
                                    <div class="header__top__right">
                                        <div class="header__top__right__cart">
                                            <a href="Dispatcher?btAction=ViewCart"><img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/cart.png?alt=media&token=efd1a1cb-af41-428a-928f-efac57e95744" alt="">
                                                <c:if test="${not empty sessionScope.COUNTITEM}">
                                                    <span>${sessionScope.COUNTITEM}</span>
                                                </c:if>
                                                <c:if test="${empty sessionScope.COUNTITEM}">
                                                    <span>0</span>
                                                </c:if> 
                                            </a>
                                        </div>
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
                                    <li class="active"><a href="Dispatcher?btAction=search&txtSearch=&cbCate=Category">Shop</a></li>
                                        <c:if test="${sessionScope.ROLE eq true}">
                                        <li>
                                            <a href="Dispatcher?btAction=SearchManage&txtSearchManage=&cbCate=Category&txtMin=&txtMax=">Manage</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </header>
            <div class="back">
                <a href="Dispatcher?btAction=search&txtSearch=${sessionScope.SEARCHVALUE}&cbCate=${sessionScope.NAMECATE}&txtMin=${sessionScope.MIN}&txtMax=${sessionScope.MAX}"><i class="fa fa-angle-left"></i>BACK</a>
            </div>
            <div class="body-content">
                <form action="Dispatcher" method="POST">
                    <c:set var="dto" value="${sessionScope.INFO}"/>
                    <div class="body-left">
                        <img src="${dto.imageProduct}"/>
                    </div>
                    <div class="body-right">
                        <h3>${dto.productName}</h3>
                        <p>$ ${dto.price}</p>
                        Quantity in storage: ${dto.quantity}
                        Quantity of product: 
                        <input type="number" name="quantity" max="${dto.quantity}" min="1" value="1" />
                        <input type="hidden" name="txtID" value="${dto.productID}"/>
                        <p>Description: <span>${dto.description}</span></p>
                        <p>Create date: ${dto.createDate}</p>
                        <p>Invalid Date: ${dto.invalidDate}</p>
                        <c:if test="${sessionScope.ROLE eq false}">
                            <c:if test="${not empty sessionScope.FULLNAME}">
                                <button name="btAction" value="addToCart">Add to cart</button>
                            </c:if>
                            <c:if test="${empty sessionScope.FULLNAME}">
                                <button name="btAction" value="login">Add to cart</button>
                            </c:if>
                        </c:if>
                    </div>
                </form>
            </div>
        </c:if>
        <c:if test="${empty sessionScope.INFO}">
            <c:import url="InvalidPage.jsp"/>
        </c:if>
    </body>
</html>
