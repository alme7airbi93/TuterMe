<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="fragment/header.jsp"%>

</head>

<body>
<%@include file="fragment/bodyHeader.jsp"%>



<div class="container" style="margin-bottom:30px; padding-top:100px; width:100%; rgba(255,255,255,0.80)">



    <div class="row " style="margin-top: 50px">


        <div class="col-md-12">
            <div class="carousel slide slider-border" data-ride="carousel" data-type="multi" data-interval="3000" id="myCarousel2">
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="col-md-2 col-sm-6 col-xs-12"><a href="#"><img src="<c:url value="/resources/images/instructor/${course.instructorid}/courses/${course.id}/1.png" />" class="img-responsive"></a></div>
                    </div>
                    <c:forEach var="lesson" items="${lessons}">
                        <div class="item">
                            <div class="col-md-2 col-sm-6 col-xs-12"><a href="#"><img src="<c:url value="/resources/images/instructor/${course.instructorid}/courses/${course.id}/${lesson.id + 1}.png" />" class="img-responsive"></a></div>
                        </div>
                    </c:forEach>
                </div>


            </div>
            <a class="left carousel-control left-arrow" href="#myCarousel2" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
            <a class="right carousel-control left-arrow" href="#myCarousel2" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
        </div>

    </div>

<c:forEach var="topic" items="${topics}">

    <div class="row ">
        <div class="col-md-12"><h1>${topic.name}</h1></div>
        <div class="col-md-12">
            <div class="carousel slide slider-border" data-ride="carouse" data-type="multi" data-interval="3000" id="myCarousel3">
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="col-md-2 col-sm-6 col-xs-12"><a href="#"><img src="<c:url value="/resources/images/instructor/${course.instructorid}/courses/${course.id}/1.png" />" class="img-responsive"></a></div>
                    </div>
                    <c:forEach var="lesson" items="${topic.lessons}">
                        <div class="item">
                            <div class="col-md-2 col-sm-6 col-xs-12"><a href="#"><img src="<c:url value="/resources/images/instructor/${course.instructorid}/courses/${course.id}/${lesson.id + 1}.png" />" class="img-responsive"></a></div>
                        </div>
                    </c:forEach>
                </div>


            </div>
            <a class="left carousel-control left-arrow" href="#myCarousel3" data-slide="prev"><i class="glyphicon glyphicon-chevron-left"></i></a>
            <a class="right carousel-control left-arrow" href="#myCarousel3" data-slide="next"><i class="glyphicon glyphicon-chevron-right"></i></a>
        </div>

    </div>
</c:forEach>

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
