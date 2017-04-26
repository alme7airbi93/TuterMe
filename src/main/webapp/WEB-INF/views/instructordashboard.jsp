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






    <div class="container-wrapper">
        <div class="container">
            <div class="page-header">
                <h1>Instructor Dashboard</h1>
                <p class="lead">This is your dashboard as an instructor, get started by creating a course, or editing a previously created course</p>
            </div>

            <a href="<c:url value="/course/addCourse" /> " class="btn btn-primary">
                Create Course</a>

            <br><br>

            <!-- table for products -->
            <table class="table table-striped table-hover">
                <thead>
                <tr class="bg-success">
                    <th>Course Thumb</th>
                    <th>Name</th>
                    <th>Rating</th>
                    <th>Condition</th>
                    <th>Price</th>
                    <th></th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="course" items="${user.courses}">
                    <tr>
                        <div class="col-md-4">
                        <td ><img src="<c:url value="/resources/images/instructor/${user.userId}/courses/${course.courseId}/${course.courseId}.png" />"
                                  alt="image" style="width: 100%"></td> </div>
                        <td>${course.name}</td>
                        <td>${course.rating}</td>
                        <td>${course.enabled}</td>
                        <td>${course.price} AED</td>
                        <td><a href="<c:url value="/course/updateCourse/${course.courseId}" />">
                            <span class="glyphicon glyphicon-info-sign"></span></a>
                            <a href="<c:url value="/course/editCourse/${course.courseId}" />">
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
