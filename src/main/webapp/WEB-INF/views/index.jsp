<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="fragment/header.jsp"%>

</head>

<body>
<%@include file="fragment/bodyHeader.jsp"%>

This is the fragment we have the problem with



<!-- MENU SECTION END-->
<div id="slideshow-sec" style="margin-top:70px" >
    <div id="carousel-div" class="carousel slide" data-ride="carousel" >

        <div class="carousel-inner">
            <div class="item active">

                <img src="images/1.jpg" alt="" />
                <div class="carousel-caption">
                    <h1 class="wow slideInLeft" data-wow-duration="2s" > Multi Pager Template</h1>
                    <h2 class="wow slideInRight" data-wow-duration="2s" >Muti Purpose Use</h2>
                </div>

            </div>
            <div class="item">
                <img src="images/2.jpg" alt="" />
                <div class="carousel-caption">
                    <h1 class="wow slideInLeft" data-wow-duration="2s" >Awesome Usage</h1>
                    <h2 class="wow slideInRight" data-wow-duration="2s" >Bootstrap 3.2</h2>
                </div>
            </div>
            <div class="item">
                <img src="images/3.jpg" alt="" />
                <div class="carousel-caption">
                    <h1 class="wow slideInLeft" data-wow-duration="2s" >Easy To Customize </h1>
                    <h2 class="wow slideInRight" data-wow-duration="2s" >Free To Download</h2>
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
            <img src="images/portfolio/1.jpg" alt="img01"/>
            <figcaption>
                <h2 >Programming</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/1.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInDown">
            <img src="images/portfolio/2.jpg" alt="img01"/>
            <figcaption>
                <h2>Events</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/2.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInRight">
            <img src="images/portfolio/3.jpg" alt="img01"/>
            <figcaption>
                <h2>music</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/3.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInLeft">
            <img src="images/portfolio/4.jpg" alt="img01"/>
            <figcaption>
                <h2>Vintage</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/4.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="images/portfolio/5.jpg" alt="img01"/>
            <figcaption>
                <h2>Typers</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/5.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>

        <figure class="effect-oscar  wowload fadeInRight">
            <img src="images/portfolio/6.jpg" alt="img01"/>
            <figcaption>
                <h2>hotel</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/6.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="images/portfolio/7.jpg" alt="img01"/>
            <figcaption>
                <h2>Chinese</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/7.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="images/portfolio/8.jpg" alt="img01"/>
            <figcaption>
                <h2>Dicrap</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/8.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="images/portfolio/9.jpg" alt="img01"/>
            <figcaption>
                <h2>Coffee</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/9.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="images/portfolio/10.jpg" alt="img01"/>
            <figcaption>
                <h2>cameras</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/10.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="images/portfolio/11.jpg" alt="img01"/>
            <figcaption>
                <h2>design</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/11.jpg" title="1" data-gallery>View more</a></p>
            </figcaption>
        </figure>
        <figure class="effect-oscar  wowload fadeInUp">
            <img src="images/portfolio/12.jpg" alt="img01"/>
            <figcaption>
                <h2>studio</h2>
                <p>Lily likes to play with crayons and pencils<br>
                    <a href="images/portfolio/12.jpg" title="1" data-gallery>View more</a></p>
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
