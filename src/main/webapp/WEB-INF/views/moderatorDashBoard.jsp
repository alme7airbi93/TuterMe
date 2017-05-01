<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="fragment/header.jsp" %>

</head>

<body>
<%@include file="fragment/bodyHeader.jsp" %>


<div class="container" style="margin-bottom:30px; padding-top:100px; width:100%; rgba(255,255,255,0.80)">

    <div class="container-wrapper">
        <div class="container">
            <div class="page-header">
                <h1>Moderator Dashboard</h1>
                <p class="lead">This is your dashboard as a moderator</p>

                <c:if test="${message != null}">
                    <div style="background-color: mediumseagreen">
                        <p>${message}</p>
                    </div>
                </c:if>

            </div>
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
                <c:forEach var="course" items="${indexCourses}">
                    <tr>
                        <div class="col-md-4">
                            <td><img
                                    src="<c:url value="/resources/images/instructor/${user.userId}/courses/${course.courseId}/${course.courseId}.png" />"
                                    alt="image" style="width: 100%"></td>
                        </div>
                        <td>${course.name}</td>
                        <td>${course.rating}</td>
                        <td>${course.enabled}</td>
                        <td>${course.price} AED</td>
                        <td><a href="<c:url value="/moderator/course/disable/${course.courseId}" />">
                            <span class="glyphicon glyphicon-remove"></span></a>
                            <a href="<c:url value="/moderator/course/enable/${course.courseId}" />">
                                <span class="glyphicon glyphicon-check"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


</div>
<!-- works -->

<!-- Footer Starts -->
<%@include file="fragment/footer.jsp" %>
<!-- # Footer Ends -->

</body>
</html>
