<%@ page import="ae.tutorme.model.Lesson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<%@include file="fragment/header.jsp"%>

</head>

<body>
<%@include file="fragment/bodyHeader.jsp"%>


<% Lesson lesson = new Lesson();
    request.setAttribute("lesson",lesson); %>

<jsp:useBean id="Lesson" scope="request" class="ae.tutorme.model.Lesson">
    <jsp:setProperty name="lesson" property="*"/>
</jsp:useBean>
<jsp:useBean id="Topic" scope="request" class="ae.tutorme.model.Topic">
    <jsp:setProperty name="topic" property="*"/>
</jsp:useBean>
<jsp:useBean id="Course" scope="request" class="ae.tutorme.model.Course">
    <jsp:setProperty name="course" property="*"/>
</jsp:useBean>


<div class="container" style="margin-bottom:30px; padding-top:100px; width:100%; rgba(255,255,255,0.80)">


    <c:url var="addlesson" value="/lesson/add/${course.courseId}/${topic.id}"/>

    <form:form role="form" class="form-horizontal" action="${addlesson}" method="post" commandName="lesson" enctype="multipart/form-data">
        <h1>Course information: </h1>
        <div class="form-group">
            <div class="col-sm-9">
                <form:input path="lessonName"  type="text" class="form-control" id="lessonName" placeholder="Lesson Name" />
            </div>
        </div>
        <div class="form-group">

            <div class="col-sm-9">
                <p>Upload Lesson Video </p>  <form:input    path="video" id="video" type="file" class="form:input-larg"/>
            </div>
            <div class="col-sm-9">
              <p>Upload Lesson thumbnail </p>  <form:input    path="picture" id="picture" type="file" class="form:input-larg"/>
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
    <p class="wowload flipInX"><a href="#"><i class="fa fa-facebook fa-2x"></i></a> <a href="#"><i class="fa fa-instagram fa-2x"></i></a> <a href="#"><i class="fa fa-twitter fa-2x"></i></a> <a href="#"><i class="fa fa-flickr fa-2x"></i></a> </p>
    جميع الحقوق محفوظه حق قروب علي الزعابي :)
</div>
<!-- # Footer Ends -->




<!-- #Header Starts -->




</body>
</html>
