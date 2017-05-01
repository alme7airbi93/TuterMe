<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>TeachMe || علمني</title>
    <%@ include file="fragment/header.jsp" %>

</head>

<body style="background-image:url(images/BG.jpg); background-position:center; background-repeat:no-repeat">

<!-- Header Starts -->
<%@ include file="fragment/bodyHeader.jsp"%>
<!-- #Header Starts -->

<div class="container" style="margin-bottom:10px;">

    <ul class="list-unstyled video-list-thumbs row">
        <li class="col-md-2">
            <a href="#" title="1.Introducton" style="height:175px;">
                <img src="images/portfolio/90.jpg" alt="Barca" class="img-responsive" height="100px"/>
                <h2>1.Introdction</h2>

                <span class="duration">03:15</span>
            </a>
        </li>
        <li class="col-md-2">
            <a href="#" title="2.Loops" style="height:175px;">
                <img src="images/courses/java/java1.gif" alt="Barca" class="img-responsive" height="100px"/>
                <h2>2.Loops</h2>

                <span class="duration">11:42</span>
            </a>
        </li>
        <li class="col-md-2">
            <a href="#" title="2.if statements" style="height:175px;">
                <img src="images/courses/java/java2.gif" alt="Barca" class="img-responsive" height="100px"/>
                <h2>2.if statements</h2>

                <span class="duration">06:25</span>
            </a>
        </li>
        <li class="col-md-2">
            <a href="#" title="3.Exception Handling" style="height:175px;">
                <img src="images/courses/java/java3.jpg" alt="Barca" class="img-responsive" height="100px"/>
                <h2>3.Exception Handling</h2>

                <span class="duration">03:15</span>
            </a>

    </ul>


</div>


<!-- works -->

<!-- Footer Starts -->

<%@ include file="fragment/footer.jsp"%>

</body>
</html>
