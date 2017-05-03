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


<h3 align="center">${message}</h3>
<form role="form" class="form-horizontal" action="${adCourse}" method="post"  >
    <h3>User information: </h3>
    <div class="form-group">
        <div class="col-sm-5">
            <input name="userName" type="email" class="form-control"  placeholder="User Name" value="${user.userName}" />
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-5">
            <input name="password" type="password" class="form-control"  placeholder="Password" value="${user.password}" />
        </div>
    </div>
    <div class="col-sm-2">
        <input type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 5px"/>
    </div>

</form>

</div>
<!-- Footer Starts -->
<%@include file="fragment/footer.jsp"%>
<!-- # Footer Ends -->

</body>
</html>
