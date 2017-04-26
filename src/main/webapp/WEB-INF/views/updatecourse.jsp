<%@ page import="ae.tutorme.model.Topic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="fragment/header.jsp"%>

</head>

<body>
<%@include file="fragment/bodyHeader.jsp" %>

<% Topic topic = new Topic();
    request.setAttribute("topic",topic); %>

<jsp:useBean id="Course" scope="request" class="ae.tutorme.model.Course">
    <jsp:setProperty name="course" property="*"/>
</jsp:useBean>
<jsp:useBean id="Topic" scope="request" class="ae.tutorme.model.Topic">
    <jsp:setProperty name="topic" property="*"/>
</jsp:useBean>

<div class="container" style="margin-bottom:30px; padding-top:100px; width:100%; rgba(255,255,255,0.80)">


    <c:url var="updateCourse" value="/course/update"/>

    <form:form role="form" class="form-horizontal" action="${updateCourse}" method="post" commandName="course">
        <h1>Course information: </h1>
        <div class="form-group">
            <div class="col-sm-9">
                <form:input path="name" type="text" class="form-control" id="name" placeholder="Course Name"/>
            </div>
        </div>

        <div class="form-group">

            <div class="col-sm-9">
                <form:textarea path="description" rows="5" cols="30" class="form-control" id="coursedesc"
                               placeholder="Enter course description here..."/>
            </div>
        </div>

        <div class="form-group">

            <div class="col-sm-9">
                <p>Upload course thumbnail </p>  <form:input path="courseImage" id="productImage" type="file"  class="form:input-larg"/>
            </div>
        </div>


        <div class="col-sm-5">
            <button type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 5px">
                update
            </button>
        </div>
    </form:form>


    <div class="row grid-divider">
        <c:forEach var="topic" items="${course.topics}">
            <h3>${topic.topicName}</h3>
            <c:forEach var="lesson" items="${topic.lessons}">
                <h4>${lesson.name}</h4>
                <img src="<c:url value="/resources/images/instructor/${course.instructor.userId}/courses/${course.courseId}/topic/${topic.id}/${lesson.id}.png"/>">
                <img href="<c:url value="/lesson/update/${lesson.id}" />" src="<c:url value="/resources/images/glyphicons/glyphicons-31-pencil.png"/>">
            </c:forEach>
            <h4>add lesson</h4>
            <img href="<c:url value="/lesson/add/${course.courseId}/${topic.id}" />" src="<c:url value="/resources/images/glyphicons/glyphicons-191-plus-sign.png"/>">
        </c:forEach>


        <c:url var="addTopic" value="/topic/add/${course.courseId}"/>
        <form:form role="form" class="form-horizontal" action="${addTopic}" method="post" commandName="topic">
            <h5>You can add topics here and modify them later on !!! </h5>
            <div class="form-group">
                <div class="col-sm-9">
                    <form:input path="topicName" type="text" class="form-control" placeholder="Topic Title"/>
                </div>
            </div>
            <div class="col-sm-5">
                <input type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 5px"/>
            </div>
        </form:form>


    </div>
    <!-- works -->

    <!-- Footer Starts -->
    <div class="footer text-center spacer">
        <p class="wowload flipInX"><a href="#"><i class="fa fa-facebook fa-2x"></i></a> <a href="#"><i
                class="fa fa-instagram fa-2x"></i></a> <a href="#"><i class="fa fa-twitter fa-2x"></i></a> <a
                href="#"><i class="fa fa-flickr fa-2x"></i></a></p>
        جميع الحقوق محفوظه حق قروب علي الزعابي :)
    </div>
    <!-- # Footer Ends -->


    <!-- #Header Starts -->


</div>
</body>
</html>
