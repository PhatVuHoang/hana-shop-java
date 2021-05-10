<%-- 
    Document   : login
    Created on : Jan 7, 2021, 10:25:48 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Parisienne&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
        <style>
            body {
                font-family: "Lato", sans-serif;
            }

            .main-head{
                height: 150px;
                background: #FFF;

            }
            h2{
                font-size: 4rem;
            }
            .sidenav {
                height: 100%;
                background-image: url(https://i.pinimg.com/originals/32/7a/40/327a40487e7c1539281c6ac01c484e11.jpg);
                background-size: cover;
                background-repeat: none;
                overflow-x: hidden;
                padding-top: 20px;
                position: relative;
            }

            .login-main-text{
                position: absolute;
                top: 0;
                right: 0;
                font-family: 'Parisienne', cursive;
            }

            .main {
                padding: 0px 10px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
            }

            @media screen and (max-width: 450px) {
                .login-form{
                    margin-top: 10%;
                }

                .register-form{
                    margin-top: 10%;
                }
            }

            @media screen and (min-width: 768px){
                .main{
                    margin-left: 40%; 
                }

                .sidenav{
                    width: 40%;
                    position: fixed;
                    z-index: 1;
                    top: 0;
                    left: 0;
                }

                .login-form{
                    margin-top: 80%;
                }

                .register-form{
                    margin-top: 20%;
                }
            }


            .login-main-text{
                margin-top: 20%;
                padding: 60px;
                color: #fff;
            }

            .login-main-text h2{
                font-weight: 300;
            }

            .btn-black{
                background-color: #000;
                color: #fff;
                border: 1px solid white;
                transition: 0.5s;
            }
            .btn-black:hover{
                background-color: white;
                color: orange;
                border: 1px solid orange;
                transition: 0.5s;
            }
            .back{
                margin-left: 20px;
                margin-top: 20px;
            }
            .back a{
                text-decoration: none;
                color: black;
                font-size: 20px;
            }
        </style>
        <title>Login</title>
    </head>
    <body>

        <div class="sidenav">
            <div class="login-main-text">
                <h2>Login Page</h2>
            </div>
        </div>
        <div class="main">
            <div class="back">
                <a href="Dispatcher">
                    <i class="fa fa-angle-left"></i> <span>Back</span>
                </a>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="login-form">
                    <form action="Dispatcher" method="POST">
                        <font color="red">${requestScope.ERROR}</font><br/>
                        <div class="form-group">
                            <label>User Name</label>
                            <input type="text" class="form-control" placeholder="User Name" name="txtUsername" value="">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" placeholder="Password" name="txtPassword" value="">
                        </div>

                        <input class="btn btn-black" type="submit" value="Login" name="btAction" />
                    </form>
                </div>
            </div>
        </div>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </body>
</html>
