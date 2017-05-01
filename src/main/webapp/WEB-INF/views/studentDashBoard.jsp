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

<body>
<div class="topbar animated fadeInLeftBig"></div>

<!-- Header Starts -->
<%@ include file="fragment/bodyHeader.jsp"%>
<!-- #Header Starts -->

-----------------------------------------


<!-- SLIDESHOW SECTION END-->

<!-- works -->
<div class="container" style="margin-bottom:30px; padding-top:100px; width:100%; rgba(255,255,255,0.80)">

    <div id="works" class=" clearfix grid" style="rgba(255,255,255,0.8)">

        <c:forEach var="enrollment" items="${user.enrollments}">
        <div class="col-xs-6 col-sm-3 col-md-2">
            <div class="col-item">
                <div class="post-img-content">
                    <img src="<c:url value="/resources/images/instructor/${enrollment.course.instructor.userId}/courses/${enrollment.course.courseId}/${enrollment.course.courseId}.png" />"
                         class="img-responsive" alt="img01"/>
                    <span class="post-title">
                      <b>${enrollment.course.category.name}</b>
                  </span>
                </div>
                <div class="info">
                    <div class="row">
                        <div class="price col-md-12">
                            <h5>${enrollment.course.name}</h5>
                        </div>
                    </div>
                    <div class="row">
                        <div class=" col-md-7">
                            <h5 class="price-text-color">${enrollment.course.price} AED</h5>
                        </div>
                    </div>
                </div>
                <div class="clear-left">
                    <p class="btn-details">
                        <i class="fa fa-list"></i>
                        <a href="<c:url value="/student/enrolled/course/${enrollment.course.courseId}"/>" class="hidden-sm">Course Lessons</a></p>
                </div>
            </div>
        </div>
        </c:forEach>

    </div>
      </div>
<!-- works -->

<!-- Footer Starts -->
<%@ include file="fragment/footer.jsp"%>
</body>
</html>
