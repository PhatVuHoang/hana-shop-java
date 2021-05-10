<%-- 
    Document   : main
    Created on : Jan 8, 2021, 3:19:30 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="description" content="Cake Template" />
        <meta name="keywords" content="Cake, unica, creative, html" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Cake | Template</title>

        <!-- Google Font -->
        <link
            href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
            />

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="css/flaticon.css" type="text/css" />
        <link rel="stylesheet" href="css/barfiller.css" type="text/css" />
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
        <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    </head>
    <body>
        <c:set var="fullname" value="${sessionScope.FULLNAME}"/>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__logo">
                <a href="./index.html"><img style="width: 80px; height: 80px;" src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/3e27b915-f803-4e3f-bf8b-478b3548e3e5_200x200.png?alt=media&token=62252a05-1de4-4cc8-9a50-762348cf7b7b" alt="" /></a>
            </div>
            <div id="mobile-menu-wrap"></div>

        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="header__top__inner">
                                <div class="header__top__left">
                                    <ul>
                                        <c:if test="${empty fullname}">
                                            <li><a href="Dispatcher?btAction=login">Login</a></li>
                                            </c:if>
                                            <c:if test="${not empty fullname}">
                                            <li>Welcome, ${fullname}</li>
                                            <li><a href="Dispatcher?btAction=Logout">Logout</a></li>
                                            </c:if>

                                    </ul>
                                </div>
                                <div class="header__logo">
                                    <a href="#"
                                       ><img
                                            style="width: 80px; height: 80px"
                                            src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/3e27b915-f803-4e3f-bf8b-478b3548e3e5_200x200.png?alt=media&token=62252a05-1de4-4cc8-9a50-762348cf7b7b"
                                            alt=""
                                            /></a>
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
                            <form action="Dispatcher" method="POST">
                                <ul>
                                    <li class="active"><a href="Dispatcher">Home</a></li>
                                    <li>
                                        <a href="#ABOUT">About</a>
                                    </li>
                                    <li>
                                        <a href="SearchServlet">Shop</a>
                                    </li>
                                    <c:if test="${sessionScope.ROLE eq true}">
                                        <li>
                                            <a href="SearchManageServlet">Manage</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </form>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="hero__slider owl-carousel">
                <div
                    class="hero__item set-bg"
                    data-setbg="https://wallpaperaccess.com/full/1265340.jpg"
                    >
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-8">
                                <div class="hero__text">
                                    <h2>Making your life sweeter one bite at a time!</h2>
                                    <a href="#" class="primary-btn">Our Candy</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hero__item set-bg" data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/hero-1.jpg?alt=media&token=2b823222-97a0-4b33-bd73-7499348bce50">
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-8">
                                <div class="hero__text">
                                    <h2>Making your life sweeter one bite at a time!</h2>
                                    <a href="#" class="primary-btn">Our Cake</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div
                    class="hero__item set-bg"
                    data-setbg="https://charcome.files.wordpress.com/2020/08/0952e9d8c44d9e1fcc1e9b6da06ca49c.jpg"
                    >
                    <div class="container">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-8">
                                <div class="hero__text">
                                    <h2>Making your life sweeter one bite at a time!</h2>
                                    <a href="#" class="primary-btn">Our Coffee</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- About Section Begin -->
        <section class="about spad" id="ABOUT">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="about__text">
                            <div class="section-title">
                                <span>About Hana Shop</span>
                                <h2>Candies, Cakes and Coffee from the house of Queens!</h2>
                            </div>
                            <p>
                                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Qui
                                voluptatem eligendi, omnis ut molestias placeat temporibus
                                voluptas illo maxime numquam.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="about__bar">
                            <div class="about__bar__item">
                                <p>Cake design</p>
                                <div id="bar1" class="barfiller">
                                    <div class="tipWrap"><span class="tip"></span></div>
                                    <span class="fill" data-percentage="95"></span>
                                </div>
                            </div>
                            <div class="about__bar__item">
                                <p>Cake Class</p>
                                <div id="bar2" class="barfiller">
                                    <div class="tipWrap"><span class="tip"></span></div>
                                    <span class="fill" data-percentage="80"></span>
                                </div>
                            </div>
                            <div class="about__bar__item">
                                <p>Cake Recipes</p>
                                <div id="bar3" class="barfiller">
                                    <div class="tipWrap"><span class="tip"></span></div>
                                    <span class="fill" data-percentage="90"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Section End -->

        <!-- Categories Section Begin -->
        <div class="categories">
            <div class="container">
                <div class="row">
                    <div class="categories__slider owl-carousel">
                        <div class="categories__item">
                            <div class="categories__item__icon">
                                <span class="flaticon-029-cupcake-3"></span>
                                <h5>Cupcake</h5>
                            </div>
                        </div>
                        <div class="categories__item">
                            <div class="categories__item__icon">
                                <span class="flaticon-034-chocolate-roll"></span>
                                <h5>Butter</h5>
                            </div>
                        </div>
                        <div class="categories__item">
                            <div class="categories__item__icon">
                                <span class="flaticon-005-pancake"></span>
                                <h5>Red Velvet</h5>
                            </div>
                        </div>
                        <div class="categories__item">
                            <div class="categories__item__icon">
                                <span class="flaticon-030-cupcake-2"></span>
                                <h5>Biscuit</h5>
                            </div>
                        </div>
                        <div class="categories__item">
                            <div class="categories__item__icon">
                                <span class="flaticon-006-macarons"></span>
                                <h5>Donut</h5>
                            </div>
                        </div>
                        <div class="categories__item">
                            <div class="categories__item__icon">
                                <span class="flaticon-006-macarons"></span>
                                <h5>Cupcake</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Categories Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div
                                class="product__item__pic set-bg"
                                data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/shop%2Fproduct-1.jpg?alt=media&token=cce0ed8e-c789-41b3-bffc-a36632a29ccc"
                                >
                                <div class="product__label">
                                    <span>Cupcake</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Dozen Cupcakes</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div
                                class="product__item__pic set-bg"
                                data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/shop%2Fproduct-2.jpg?alt=media&token=9da4b1a0-0db3-4bd4-97e4-edeae4c191a1"
                                >
                                <div class="product__label">
                                    <span>Cupcake</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Cookies and Cream</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div
                                class="product__item__pic set-bg"
                                data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/shop%2Fproduct-3.jpg?alt=media&token=88197e50-e006-47e4-9853-9b9386dd13bf"
                                >
                                <div class="product__label">
                                    <span>Cupcake</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Gluten Free Mini Dozen</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div
                                class="product__item__pic set-bg"
                                data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/shop%2Fproduct-4.jpg?alt=media&token=7eb82909-1da3-4b2d-b9d7-820304e68ba2"
                                >
                                <div class="product__label">
                                    <span>Cupcake</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Cookie Dough</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div
                                class="product__item__pic set-bg"
                                data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/shop%2Fproduct-5.jpg?alt=media&token=13b052f9-f8ed-4d19-afe6-73d676f49159"
                                >
                                <div class="product__label">
                                    <span>Cupcake</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Vanilla Salted Caramel</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div
                                class="product__item__pic set-bg"
                                data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/shop%2Fproduct-6.jpg?alt=media&token=6ce613fb-a361-4508-8dd2-a3e62aae9f23"
                                >
                                <div class="product__label">
                                    <span>Cupcake</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">German Chocolate</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div
                                class="product__item__pic set-bg"
                                data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/shop%2Fproduct-7.jpg?alt=media&token=8a5ae565-c834-4d93-b397-b57152bad881"
                                >
                                <div class="product__label">
                                    <span>Cupcake</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Dulce De Leche</a></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div
                                class="product__item__pic set-bg"
                                data-setbg="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/shop%2Fproduct-8.jpg?alt=media&token=1fd2c760-a844-4d63-83f5-d0b927afc2a6"
                                >
                                <div class="product__label">
                                    <span>Cupcake</span>
                                </div>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="#">Mississippi Mud</a></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Section End -->

        <!-- Testimonial Section Begin -->
        <section class="testimonial spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="section-title">
                            <span>Testimonial</span>
                            <h2>Our client say</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="testimonial__slider owl-carousel">
                        <div class="col-lg-6">
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/testimonial%2Fta-1.jpg?alt=media&token=9f8b2495-31f8-452c-b328-0be0268cb3f1" alt="" />
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Kerry D.Silva</h5>
                                        <span>New york</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                                    do eiusmod tempor incididunt ut labore et dolore magna aliqua
                                    viverra lacus vel facilisis.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/testimonial%2Fta-2.jpg?alt=media&token=a1403438-e5cf-45e0-93fc-00bedb2ba5f7" alt="" />
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Kerry D.Silva</h5>
                                        <span>New york</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                                    do eiusmod tempor incididunt ut labore et dolore magna aliqua
                                    viverra lacus vel facilisis.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/testimonial%2Fta-1.jpg?alt=media&token=9f8b2495-31f8-452c-b328-0be0268cb3f1" alt="" />
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Ophelia Nunez</h5>
                                        <span>London</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                                    do eiusmod tempor incididunt ut labore et dolore magna aliqua
                                    viverra lacus vel facilisis.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/testimonial%2Fta-2.jpg?alt=media&token=a1403438-e5cf-45e0-93fc-00bedb2ba5f7" alt="" />
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Kerry D.Silva</h5>
                                        <span>New york</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                                    do eiusmod tempor incididunt ut labore et dolore magna aliqua
                                    viverra lacus vel facilisis.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/testimonial%2Fta-1.jpg?alt=media&token=9f8b2495-31f8-452c-b328-0be0268cb3f1" alt="" />
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Ophelia Nunez</h5>
                                        <span>London</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                                    do eiusmod tempor incididunt ut labore et dolore magna aliqua
                                    viverra lacus vel facilisis.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="testimonial__item">
                                <div class="testimonial__author">
                                    <div class="testimonial__author__pic">
                                        <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/testimonial%2Fta-2.jpg?alt=media&token=a1403438-e5cf-45e0-93fc-00bedb2ba5f7" alt="" />
                                    </div>
                                    <div class="testimonial__author__text">
                                        <h5>Kerry D.Silva</h5>
                                        <span>New york</span>
                                    </div>
                                </div>
                                <div class="rating">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
                                    do eiusmod tempor incididunt ut labore et dolore magna aliqua
                                    viverra lacus vel facilisis.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial Section End -->

        <!-- Instagram Section Begin -->
        <section class="instagram spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 p-0">
                        <div class="instagram__text">
                            <div class="section-title">
                                <span>Follow us on instagram</span>
                                <h2>Sweet moments are saved as memories.</h2>
                            </div>
                            <h5><i class="fa fa-instagram"></i> @hanashop</h5>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/instagram%2Finstagram-1.jpg?alt=media&token=2cb82da9-8365-421b-bdf3-8466f6e60621" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic middle__pic">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/instagram%2Finstagram-2.jpg?alt=media&token=e5e2fb0f-eee5-4c93-891f-7e616b95a43d" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/instagram%2Finstagram-3.jpg?alt=media&token=3b33d649-c0c6-4e52-b8a4-782e1f04938f" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/instagram%2Finstagram-4.jpg?alt=media&token=d8ae8012-2697-4843-b674-5bf51fa2da07" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic middle__pic">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/instagram%2Finstagram-5.jpg?alt=media&token=5c49ae7f-6113-4d5b-976b-030a142f1b17" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                                <div class="instagram__pic">
                                    <img src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/instagram%2Finstagram-3.jpg?alt=media&token=3b33d649-c0c6-4e52-b8a4-782e1f04938f" alt="" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Instagram Section End -->

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
                                <a href="#"><img style="width: 100px; height: 100px;" src="https://firebasestorage.googleapis.com/v0/b/hanashop-a9ce8.appspot.com/o/3e27b915-f803-4e3f-bf8b-478b3548e3e5_200x200.png?alt=media&token=62252a05-1de4-4cc8-9a50-762348cf7b7b" alt="" /></a>
                            </div>
                            <p>
                                Lorem ipsum dolor amet, consectetur adipiscing elit, sed do
                                eiusmod tempor incididunt ut labore dolore magna aliqua.
                            </p>
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
                                <input type="text" placeholder="Email" />
                                <button type="submit"><i class="fa fa-send-o"></i></button>
                            </form>
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
                    <input type="text" id="search-input" placeholder="Search here....." />
                </form>
            </div>
        </div>
        <!-- Search End -->

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
