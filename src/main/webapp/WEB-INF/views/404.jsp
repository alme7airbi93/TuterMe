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

    <div class="error-page">
        <img src="<c:url value="/resources/images/error404.png"/>">
        <h2>Oops!</h2>
        <h1 class="404error"> 404 </h1>
        <h2>Not Found</h2>
        <div class="error-details">
            Sorry, an error has occured. Requested page not found!
        </div>


        <div class="error-actions">
            <a href="<c:url value="/"/>"> </span>
                Take Me Home </a> </div>
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
