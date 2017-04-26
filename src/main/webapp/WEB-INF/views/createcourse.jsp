<%@ page import="ae.tutorme.model.Course" %>
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
<%
    Course course = new Course();
    request.setAttribute("course",course);
%>
    <jsp:useBean id="Course" class="ae.tutorme.model.Course" scope="request">
        <jsp:setProperty name="Course" property="*"/>
    </jsp:useBean>

    <c:url var="adCourse" value="/course/savecourse"/>

    <form:form role="form" class="form-horizontal" action="${adCourse}" method="post" commandName="Course" >
        <h1>Course information: </h1>
        <div class="form-group">
            <div class="col-sm-9">
                <form:input path="name"  type="text" class="form-control" id="coursename" placeholder="Course Name" />
            </div>
        </div>

        <div class="form-group">

            <div class="col-sm-9">
                <form:textarea path="description"  rows="5" cols="30" class="form-control" id="coursedesc" placeholder="Enter course description here..." />
            </div>
        </div>

        <div class="form-group">

            <div class="col-sm-9">
              <p>Upload course thumbnail </p>  <form:input    path="courseImage" id="productImage" type="file" class="form:input-larg"/>
            </div>
        </div>


        <div class="col-sm-5">
            <button type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 5px">
                Submit</button>
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
