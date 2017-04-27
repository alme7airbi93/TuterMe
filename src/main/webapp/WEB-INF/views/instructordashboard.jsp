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


    <h3>Shopping Cart</h3>



    <div class="container-wrapper">
        <div class="container">
            <div class="page-header">
                <h1>Product Inventory Page</h1>
                <p class="lead">This is the product inventory page!</p>
            </div>

            <a href="<c:url value="/admin/inventory/addProduct" />" class="btn btn-primary">
                Add Product</a>

            <br><br>

            <!-- table for products -->
            <table class="table table-striped table-hover">
                <thead>
                <tr class="bg-success">
                    <th>Photo Thumb</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Condition</th>
                    <th>Price</th>
                    <th></th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td><img src="<c:url value="/resources/images/instructor/${course.instructorid}/courses/${course.id}.png" />"
                                 alt="image" style="width: 100%"></td>
                        <td>${course.name}</td>
                        <td>${course.rating}</td>
                        <td>${course.enabled}</td>
                        <td>${product.price} AED</td>
                        <td><a href="<c:url value="/Instructor/course/courseDetail/${course.id}" />">
                            <span class="glyphicon glyphicon-info-sign"></span></a>
                            <a href="<c:url value="/Instructor/course/RequestDelete/${course.id}" />">
                                <span class="glyphicon glyphicon-remove"></span></a>
                            <a href="<c:url value="/Instructor/course/editCourse/${course.id}" />">
                                <span class="glyphicon glyphicon-pencil"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
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
