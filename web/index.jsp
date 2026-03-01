<%-- 
    Document   : index
    Created on : Feb 27, 2026, 5:56:32 PM
    Author     : vinhh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Homepage</title>
        <style>

            .carousel-inner > .item > img {
                width: 100%;       /* Luôn rộng hết cỡ khung hình */
                height: 800px;     /* Bạn có thể chỉnh con số này cho vừa mắt (ví dụ 400px hoặc 600px) */
                object-fit: cover; /* Quan trọng: Giúp ảnh không bị méo/bẹp khi co giãn */
            }

            /* Đảm bảo khung Carousel có nền đen để ảnh trông chuyên nghiệp hơn */
            .carousel-inner {
                background-color: #000;
            }
            .container {
                padding: 80px 120px;
            }

            .main-content-area {
                background-image: url('images/test.gif');
                background-size: cover;
                background-position: center;
                width: 100%;
            }
        </style>
    </head>

    <body>
        <%@include file ="menu.jspf" %>

        <div class="container text-center main-content-area">
            <h3>THE PRODUCT</h3>
            <p style="color: white"><em>We love Product</em></p>
            <p style="color: white">We have created a fictional product  website. Let's buy something.</p>
            <a href="MainController?action=welcome" class="btn btn-primary">Explore the website</a>
        </div>

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="images/iphone19.jpg" alt="iphone19">
                    <div class="carousel-caption">
                        <h3>iPhone 19</h3>
                        <p>We sell the best iPHone</p>
                    </div>
                </div>

                <div class="item">
                    <img src="images/adidas.jpeg" alt="adidas">
                    <div class="carousel-caption">
                        <h3>Adidas 99</h3>
                        <p>We sell the best Shoes</p>
                    </div>
                </div>

                <div class="item">
                    <img src="images/lg.jpeg" alt="Fridge">
                    <div class="carousel-caption">
                        <h3>LG 97</h3>
                        <p>We sell the best TV.</p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>



    </body>
</html>
