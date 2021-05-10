<%-- 
    Document   : shop
    Created on : Jan 13, 2021, 9:32:11 AM
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
        
        <title>Cake | Template</title>

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
    </head>
    <body>
        <form action="Dispatcher">
            <!-- Page Preloder -->
            <div id="preloder">
                <div class="loader"></div>
            </div>

            <!-- Offcanvas Menu Begin -->
            <div class="offcanvas-menu-overlay"></div>
            <div class="offcanvas-menu-wrapper">
                <div class="offcanvas__cart">
                    <div class="offcanvas__cart__links">
                        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                        <a href="#"><img src="img/icon/heart.png" alt=""></a>
                    </div>
                    <div class="offcanvas__cart__item">
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
                <div class="offcanvas__logo">
                    <a href="./index.html"><img src="img/logo.png" alt=""></a>
                </div>
                <div id="mobile-menu-wrap"></div>
                <div class="offcanvas__option">
                    <ul>
                        <li>USD <span class="arrow_carrot-down"></span>
                            <ul>
                                <li>EUR</li>
                                <li>USD</li>
                            </ul>
                        </li>
                        <li>ENG <span class="arrow_carrot-down"></span>
                            <ul>
                                <li>Spanish</li>
                                <li>ENG</li>
                            </ul>
                        </li>
                        <li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
                    </ul>
                </div>
            </div>
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
                                    <li class="active"><a href="SearchServlet">Shop</a></li>
                                        <c:if test="${sessionScope.ROLE eq true}">
                                        <li><a href="SearchManageServlet">Manage</a></li>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.FULLNAME}">
                                            <c:if test="${sessionScope.ROLE eq false}">
                                            <li><a href="SearchHistoryServlet">History</a></li>
                                            </c:if>
                                        </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </header>
            <!-- Header Section End -->

            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="breadcrumb__text">
                                <h2>Shop</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- Shop Section Begin -->
            <section class="shop spad">
                <div class="container">
                    <div class="shop__option">
                        <div class="row">
                            <select name="cbCate">
                                <option>Category</option>
                                <c:forEach var="category" items="${sessionScope.LISTCATE}">
                                    <option <c:if test="${category eq sessionScope.NAMECATE}">selected</c:if>>${category}</option>
                                </c:forEach>
                            </select>
                            <input style="border: 1px solid #dbdbdb; border-radius: 5px;" type="text" placeholder="Search" name="txtSearch" value="${sessionScope.SEARCHVALUE}">
                            <button style="border: none; background-color: white;width: 50px;" type="submit" name="btAction" value="search"><i class="fa fa-search"></i></button>
                            <input style="border: 1px solid #dbdbdb; border-radius: 5px;" type="number" name="txtMin" value="${sessionScope.MIN}" placeholder="Min"/>
                            <input style="border: 1px solid #dbdbdb; border-radius: 5px;" type="number" name="txtMax" min="${param.txtMin}" value="${sessionScope.MAX}" placeholder="Max"/>
                        </div>
                    </div>
                    <div class="row">
                        <c:if test="${not empty sessionScope.LISTPRODUCT}">
                            <c:forEach var="dto" items="${sessionScope.LISTPRODUCT}">
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${dto.imageProduct}">
                                            <div class="product__label">
                                                <span>${dto.nameCategory}</span>
                                            </div>
                                        </div>
                                        <div class="product__item__text">
                                            <h6>${dto.productName}</h6>
                                            <div class="product__item__price">$${dto.price}</div>
                                            <div class="cart_add">
                                                <a href="Dispatcher?btAction=info&txtSearch=${sessionScope.SEARCHVALUE}&cbCate=${sessionScope.NAMECATE}&txtMin=${sessionScope.MIN}&txtMax=${sessionScope.MAX}&IDProduct=${dto.productID}&quantity=1">View Product</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty sessionScope.LISTPRODUCT}">
                            <h2>No item is matched :( !</h2>
                        </c:if>
                    </div>
                    <div class="shop__last__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__pagination">
                                    <c:if test="${sessionScope.COUNT > 1}">
                                        <c:forEach var="page" begin="1" end="${sessionScope.COUNT}">
                                            <a href="Dispatcher?btAction=search&txtSearch=${param.txtSearch}&cbCate=${sessionScope.NAMECATE}&txtMin=${sessionScope.MIN}&txtMax=${sessionScope.MAX}&index=${page}">${page}</a>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Shop Section End -->

            <!-- Footer Section Begin -->
            <footer class="footer set-bg" data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/footer-bg.jpg?alt=media&token=2c479411-8f40-460f-9910-96fa9e9561b6">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="footer__widget">
                                <h6>WORKING HOURS</h6>
                                <ul>
                                    <li>Monday - Friday: 08:00 am – 08:30 pm</li>
                                    <li>Saturday: 10:00 am – 16:30 pm</li>
                                    <li>Sunday: 10:00 am – 16:30 pm</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="footer__about">
                                <div class="footer__logo">
                                    <a href="#"><img style="width: 80px; height: 80px;" src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/3e27b915-f803-4e3f-bf8b-478b3548e3e5_200x200.png?alt=media&token=62252a05-1de4-4cc8-9a50-762348cf7b7b" alt=""></a>
                                </div>
                                <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                                    labore dolore magna aliqua.</p>
                                <div class="footer__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="footer__newslatter">
                                <h6>Subscribe</h6>
                                <p>Get latest updates and offers.</p>
                                <form action="#">
                                    <input type="text" placeholder="Email">
                                    <button type="submit"><i class="fa fa-send-o"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-7">
                                <p class="copyright__text text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </p>
                            </div>
                            <div class="col-lg-5">
                                <div class="copyright__widget">
                                    <ul>
                                        <li><a href="#">Privacy Policy</a></li>
                                        <li><a href="#">Terms & Conditions</a></li>
                                        <li><a href="#">Site Map</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer Section End -->

            <!-- Search Begin -->
            <div class="search-model">
                <div class="h-100 d-flex align-items-center justify-content-center">
                    <div class="search-close-switch">+</div>
                    <form class="search-model-form">
                        <input type="text" id="search-input" placeholder="Search here.....">
                    </form>
                </div>
            </div>
            <!-- Search End -->
        </form>
        <!-- Js Plugins -->
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
