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



    <div class="container" style="margin-top:100px; margin-bottom:10px;">
        <div class="card">
            <div class="container-fliud">
                <div class="wrapper row">
                    <div class="preview col-md-6">

                        <div class="preview-pic tab-content">
                            <div class="tab-pane active" id="pic-1"><img src="<c:url value="/resources/images/instructor/${course.instructor.userId}/courses/${course.courseId}/${course.courseId}.png" />" /></div>

                            <c:forEach var="topic" items="${course.topics}">
                                <c:forEach var="lesson" items="${topic.lessons}">
                                    <div class="tab-pane" id="pic-${lesson.id}"><img src="<c:url value="/resources/images/instructor/${course.instructor.userId}/courses/${course.courseId}/topics/${topic.id}/${lesson.id}.png"/>" /></div>
                                </c:forEach>
                            </c:forEach>
                        </div>
                        <ul class="preview-thumbnail nav nav-tabs">
                            <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="<c:url value="/resources/images/instructor/${course.instructor.userId}/courses/${course.courseId}/${course.courseId}.png"/>"/></a></li>
                            <c:forEach var="topic" items="${course.topics}">
                                <c:forEach var="lesson" items="${topic.lessons}">
                            <li><a data-target="#pic-${lesson.id}" data-toggle="tab"><img src="<c:url value="/resources/images/instructor/${course.instructor.userId}/courses/${course.courseId}/topics/${topic.id}/${lesson.id}.png"/>" /></a></li>
                                 </c:forEach>
                            </c:forEach>
                             </ul>

                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">${course.name}</h3>
                        <c:if test="${course.rating < 1 && course.rating > 0}">
                            <div class="rating">
                                <div class="stars"><c:url var="resourse" value="/recources"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <span class="fa fa-star"></span>
                                </div>
                                <span class="review-no">142 ratings</span>
                            </div>
                        </c:if>
                        <c:if test="${course.rating < 1 && course.rating > 0}">
                        <div class="rating">
                            <div class="stars">
                                <img src ="${resourse}/images/glyphicons/glyphicons-507-star-half.png"/>
                                <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                <span class="fa fa-star"></span>
                            </div>

                        </div>
                        </c:if>
                        <c:if test="${course.rating > 1 && course.rating < 1.5}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                        </c:if>
                        <c:if test="${course.rating > 1.5 && course.rating < 2}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-507-star-half.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                        </c:if>
                        <c:if test="${course.rating >= 2 && course.rating < 2.5}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                        </c:if>
                        <c:if test="${course.rating >= 2.5 && course.rating < 3}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-507-star-half.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                        </c:if>
                        <c:if test="${course.rating >= 3 && course.rating < 3.5}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                        </c:if>
                        <c:if test="${course.rating >= 3.5 && course.rating < 4}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-507-star-half.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <span class="fa fa-star"></span>
                                </div>
                                <span class="review-no">142 ratings</span>
                            </div>
                        </c:if>
                        <c:if test="${course.rating >= 4 && course.rating < 4.5}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-49-star-empty.png"/>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                        </c:if>
                        <c:if test="${course.rating >= 4.5 && course.rating < 5}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-507-star-half.png"/>
                                    <span class="fa fa-star"></span>
                                </div>
                                <span class="review-no">142 ratings</span>
                            </div>
                        </c:if>
                        <c:if test="${course.rating >= 5}">
                            <div class="rating">
                                <div class="stars">
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <img src ="${resourse}/images/glyphicons/glyphicons-50-star.png"/>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                        </c:if>
                        <p class="product-description">${course.description}</p>
                        <h4 class="price">price: <span>${course.price} AED</span></h4>
                        <p class="vote"><strong>Instructor: </strong>${course.instructor.name}</p>


                        <div class="action">
                          <a href="<c:url value="/enrollment/enroll/${course.courseId}"/> " class="add-to-cart btn btn-default" type="button">Enroll in course</a>
                        </div>

                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${message != null}">
        <div style="background-color: #4cae4c">
            <h3 style="color: #2a6496">${message}</h3>
        </div>
    </c:if>




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
