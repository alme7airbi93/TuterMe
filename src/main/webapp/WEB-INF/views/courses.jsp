<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>TeachMe || علمني</title>

<!-- Google fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300,70" rel="stylesheet" type="text/css">

<!-- font awesome -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<!-- bootstrap -->
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />

<!-- animate.css -->
<link rel="stylesheet" href="assets/animate/animate.css" />
<link rel="stylesheet" href="assets/animate/set.css" />

<!-- gallery -->
<link rel="stylesheet" href="assets/gallery/blueimp-gallery.min.css">

<!-- favicon -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<!-- FLEXSLIDER STYLE  -->
    <link href="assets/css/flexslider.css" rel="stylesheet" />


<link rel="stylesheet" href="assets/style.css">

</head>

<body  style="background-image:url(images/BG.jpg); background-position:center; background-repeat:no-repeat">
<div class="topbar animated fadeInLeftBig"></div>

<!-- Header Starts -->
<div class="navbar-wrapper">
      <div class="container">

        <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="top-nav">
          <div class="container">
            <div class="navbar-header">
              <!-- Logo Starts --><a class="navbar-brand" href="#home"><a class="navbar-brand" href="#home"><img src="images/logo.png" alt="logo"></a></a><!-- #Logo Ends -->


              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

            </div>


            <!-- Nav Starts -->
            <div class="navbar-collapse  collapse">
              <ul class="nav navbar-nav navbar-right scroll">
                 <li class="active"><a href="#works">Home</a></li>
                 <li ><a href="#about">Category</a></li>
                 <li ><a href="#partners">Become Instructor </a></li>
                 <li ><a href="#contact">Log In</a></li>
              </ul>
            </div>
            <!-- #Nav Ends -->

          </div>
        </div>

      </div>
    </div>
<!-- #Header Starts -->

-----------------------------------------


    <!-- SLIDESHOW SECTION END-->

<!-- works -->
<div class="container" style="margin-bottom:30px; padding-top:100px; width:100%; rgba(255,255,255,0.80)">

    <div id="works"  class=" clearfix grid" style="rgba(255,255,255,0.8)">

<c:forEach var="course" items="${courses}">
        <div class="col-xs-6 col-sm-3 col-md-2">
            <div class="col-item">
                <div class="post-img-content">
                    <img src="<c:url value="/resources/images/instructor/${course.instructorid}/courses/${course.id}.png" />" class="img-responsive" alt="img01"/>
                    <span class="post-title">
                      <b>${category.name}</b>
                  </span>

                </div>
                <div class="info">
                    <div class="row">
                        <div class="price col-md-12">
                            <h5>${course.name}</h5>


                        </div>

                    </div>
                    <div class="row">
                        <div class=" col-md-7">
                            <h5 class="price-text-color">${course.price} AED</h5>
                        </div>



                    </div>
                </div>
                <div class="clear-left">
                     <p class="btn-details">
                        <i class="fa fa-list"></i><a href="<c:url value="/Instructor/course/courseDetail/${course.id}" class="hidden-sm">More details</a></p>
                </div>

            </div>
        </div>

</c:forEach>



    </div>








      </div>












<!-- works -->

<!-- Footer Starts -->
<div class="footer text-center spacer">
<p class="wowload flipInX"><a href="#"><i class="fa fa-facebook fa-2x"></i></a> <a href="#"><i class="fa fa-instagram fa-2x"></i></a> <a href="#"><i class="fa fa-twitter fa-2x"></i></a> <a href="#"><i class="fa fa-flickr fa-2x"></i></a> </p>
جميع الحقوق محفوظه حق قروب علي الزعابي :)
</div>
<!-- # Footer Ends -->






<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
    <!-- The container for the modal slides -->
    <div class="slides"></div>
    <!-- Controls for the borderless lightbox -->
    <h3 class="title">Title</h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <!-- The modal dialog, which will be used to wrap the lightbox content -->
</div>



<!-- jquery -->
<script src="assets/jquery.js"></script>

<!-- wow script -->
<script src="assets/wow/wow.min.js"></script>


<!-- boostrap -->
<script src="assets/bootstrap/js/bootstrap.js" type="text/javascript" ></script>

<!-- jquery mobile -->
<script src="assets/mobile/touchSwipe.min.js"></script>
<script src="assets/respond/respond.js"></script>

<!-- gallery -->
<script src="assets/gallery/jquery.blueimp-gallery.min.js"></script>

<!-- custom script -->
<script src="assets/script.js"></script>

</body>
</html>
