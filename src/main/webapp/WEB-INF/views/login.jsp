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

    <c:url value="/login" var="login"/>
    <form action="${login}" role="form" class="form-horizontal" method="post">
        <div class="form-group">
            <label for="username" class="col-sm-3 control-label">
                Email</label>
            <div class="col-sm-9">
                <input name="username" type="email" class="form-control" id="username" placeholder="Email" />
            </div>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1" class="col-sm-3 control-label">
                Password</label>
            <div class="col-sm-9">
                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" />
            </div>
        </div>
        <div class="form-group">
            <label for="rememberMe" class="col-sm-3 control-label">
                Remember me :</label>
            <div class="col-sm-9">
                <input id="rememberMe" type="checkbox" name="remember-me" />
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
            </div>
            <div class="col-sm-5">
                <input type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 5px"/>
                <a href="javascript:;">Forgot your password?</a>
            </div>
        </div>
    </form>


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
