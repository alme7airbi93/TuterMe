<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="fragment/header.jsp"%>

</head>

<body>
<%@include file="fragment/bodyHeader.jsp"%>




<!-- MENU SECTION END-->
<div id="slideshow-sec" style="margin-top:70px" >
    <div id="carousel-div" class="carousel slide" data-ride="carousel" >

        <div class="carousel-inner">
            <div class="item active">

                <img src="<c:url value="/resources/images/carosel/01.jpg"/>" alt="" />
                <div class="carousel-caption black-text">

                    <h1 class="wow slideInLeft" data-wow-duration="2s" >Teach Me</h1>
                </div>

            </div>
            <div class="item">
                <img src="<c:url value="/resources/images/carosel/02.jpg"/>" alt="" />
                <div class="carousel-caption black-text">
                    <h1 class="wow slideInLeft" data-wow-duration="2s" >Many courses to browse through</h1>
                </div>
            </div>
            <div class="item">
                <img src="<c:url value="/resources/images/carosel/03.jpg"/>" alt="" />
                <div class="carousel-caption black-text">
                    <h1 class="wow slideInLeft" data-wow-duration="2s" >Become an instructor </h1>
                </div>

            </div>
        </div>
        <!--INDICATORS-->
        <ol class="carousel-indicators">
            <li data-target="#carousel-div" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-div" data-slide-to="1"></li>
            <li data-target="#carousel-div" data-slide-to="2"></li>
        </ol>
        <!--PREVIUS-NEXT BUTTONS-->
        <a class="left carousel-control" href="#carousel-div" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-div" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div>


<!-- SLIDESHOW SECTION END-->

<!-- works -->
<div class="container" style="margin-bottom:30px; padding-top:20px; width:100%; rgba(255,255,255,0.80)">
    <div id="works"  class=" clearfix grid" style="rgba(255,255,255,0.8)">
        <figure class="effect-oscar  wowload fadeInLeft">
            <img src="<c:url value="/resources/images/categories/programming.jpeg"/>" alt="img01"/>
            <p>  <a href="<c:url value="/logout"/>" title="1" data-gallery>View more</a></p>
            <figcaption>
                <h2>Programming</h2>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInDown">
            <img src="<c:url value="/resources/images/categories/camera.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Media</h2>
                <p> <a href="images/portfolio/2.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInRight">
            <img src="<c:url value="/resources/images/categories/math.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Mathematics</h2>
                <p>  <a href="images/portfolio/3.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInLeft">
            <img src="<c:url value="/resources/images/categories/physics.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Physics</h2>
                <p> <a href="images/portfolio/4.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="<c:url value="/resources/images/categories/healthy.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Health</h2>
                <p> <a href="images/portfolio/5.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>

        <figure class="effect-oscar  wowload fadeInRight">
            <img src="<c:url value="/resources/images/categories/Sciences.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Science</h2>
                <p>   <a href="images/portfolio/6.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="<c:url value="/resources/images/categories/geography.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Geography</h2>
                <p>  <a href="images/portfolio/7.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="<c:url value="/resources/images/categories/security.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Computer Security</h2>
                <p> <a href="images/portfolio/8.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="<c:url value="/resources/images/categories/business.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Business</h2>
                <p>  <a href="images/portfolio/9.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="<c:url value="/resources/images/categories/art.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Art</h2>
                <p>  <a href="images/portfolio/10.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="<c:url value="/resources/images/categories/music.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Music</h2>
                <p> <a href="images/portfolio/11.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="<c:url value="/resources/images/categories/SPORT.jpeg"/>" alt="img01"/>
            <figcaption>
                <h2>Sport</h2>
                  <p>  <a href="images/portfolio/12.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>




    </div>
</div>
<!-- works -->

<!-- Footer Starts -->
<div class="footer text-center spacer">
    <p class="wowload flipInX"><a href="#"><i class="fa fa-facebook fa-2x"></i></a> <a href="#"><i class="fa fa-instagram fa-2x"></i></a> <a href="#"><i class="fa fa-twitter fa-2x"></i></a> <a href="#"><i class="fa fa-flickr fa-2x"></i></a> </p>
    جميع الحقوق محفوظه حق قروب علي الزعابي :)
</div>
<!-- # Footer Ends -->




<!-- #Header Starts -->




</body>
</html>
