<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>TeachMe || علمني</title>

<!-- Google fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'">

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
              <p>
                <!-- Logo Starts --><a class="navbar-brand" href="#home"><a class="navbar-brand" href="#home"><img src="images/logo.png" alt=""/> </a></a></p>
              <p><!-- Nav Starts -->            </p>
            </div>
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
<!-- #Sarch -->
<div class="container" style="background:rgba(255,255,255,0.8); padding-top:100px; padding-bottom:20px; ">

<div class="row" >

		<form role="form">
                    <h1>Course Info:</h1>
			<div class="row">
                            <div class="col-xs-10 col-sm-6 col-md-4">
                                <div class="form-group">
                                    <input type="text" name="course_title" id="course_title" class="form-control input-lg" placeholder="Course Title" tabindex="1">
                                </div>
                            </div>
                        </div>
                <div class="row">
                    <div class="col-xs-10 col-sm-6 col-md-4">
			<div class="form-group">
                            <textarea type="text" name="description" id="description" class="form-control input-lg"  tabindex="3" placeholder="Enter Description...">Enter Description... </textarea>
			</div>
                    </div>
                </div>

      <h1>Topics: </h1>

      <div class="row" id="main_topic">
        <!--<label class="col-xs-1 control-label">Topic: </label>-->
        <div class="col-xs-10 col-sm-12 col-md-8 wrapper_topic" id="1">
                <div class="row">
                    <span id="span_lg">1. </span>
                    <div class="col-xs-8 col-md-6 row">
                        <input type="text" class="form-control input-lg" name="topic[0].title" placeholder="Title" />
                    </div>
                    <div class="col-xs-1">
                        <button type="button" class="btn btn-default addButton cc_btn_lg" id="topic_append" ><i class="fa fa-plus"></i></button>
                    </div>
                </div>
                <h2 id="lesson">Lessons: </h2>
                <div id="for_lessons_1" class="wrapper_lession">
                    <div class="row" id="1">
                    <span id="span">1. </span>
                    <div class="col-xs-3 col-sm-4 col-md-3 les_input">
                        <input type="text" class="form-control" name="name" placeholder="Name" />
                    </div>
                    <div class="col-xs-5 col-sm-4 col-md-3 les_input">
                        <input type="text" class="form-control" name="content" placeholder="Content" />
                    </div>

                    <div class="col-xs-1">
                        <button type="button" class="btn btn-default addButton addlession cc_btn" id="lesson_1" ><i class="fa fa-plus"></i></button>
                    </div>
                    </div>
                </div> <hr id="hr_form">
            </div>
            
       
      </div>

    <!-- The template for adding new field -->
    <div class="form-group hide" id="bookTemplate">
        <div class="col-xs-4 col-xs-offset-1">
            <input type="text" class="form-control" name="title" placeholder="Title" />
        </div>

        <div class="col-xs-1">
            <button type="button" class="btn btn-default removeButton"><i class="fa fa-minus"></i></button>
        </div>
    </div>

    <div class="row">
        <div class="col-xs-5" id="submit">
            <button type="submit" class="btn btn-default">Submit</button>
        </div>
    </div>






<!--			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="Register" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				<div class="col-xs-12 col-md-6"><a href="#" class="btn btn-success btn-block btn-lg">Sign In</a></div>
			</div>-->
		</form>
	</div>
</div>



<!-- #End Of Sarch --



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
<script>
    $(document).ready(function(){
       $('#topic_append').click(function(){
           var topic_id = $(this).parent('div').parent('div').parent('div').parent('div').children('div:last-child').attr('id');
           var n_id = parseInt(topic_id)+parseInt(1);
           $("#main_topic").append('<div id="'+n_id+'" class="col-xs-10 col-sm-12 col-md-8 wrapper_topic"><div class="row"><span id="span_lg">'+n_id+'. </span><div class="col-xs-8 col-md-6 row"><input type="text" class="form-control input-lg" name="topic[0].title" placeholder="Title" /></div><div class="col-xs-1"><button type="button" id="removebtn_'+n_id+'" class="btn btn-default addButton cc_btn_lg" onclick="removeTopic('+n_id+');"><i class="fa fa-minus"></i></button></div></div><h2 id="lesson">Lessons: </h2><div id="for_lessons_'+n_id+'" class="wrapper_lession"><div class="row" id="1"><span id="span">1. </span><div class="col-xs-3 col-sm-4 col-sm-4 col-md-3 les_input"><input type="text" class="form-control" name="name" placeholder="Name" /></div><div class="col-xs-5 col-sm-4 col-md-3 les_input"><input type="text" class="form-control" name="content" placeholder="Content" /></div><div class="col-xs-1"><button type="button" class="btn btn-default addButton addlession cc_btn" id="lesson_1"><i class="fa fa-plus"></i></button></div></div></div><hr id="hr_form"></div>');
       });
       
       $('#main_topic').on('click', '.addlession', function(){
            var lesson_id = $(this).parent('div').parent('div').parent('div').children('div:last-child').attr('id'); 
            var n_id = parseInt(lesson_id)+parseInt(1);
            
            $(this).parent('div').parent('div').parent('div').append('<div class="row" id="'+n_id+'"><span id="span">'+n_id+'. </span><div class="col-xs-3 col-sm-4 col-md-3 les_input"><input type="text" class="form-control" name="name" placeholder="Name" /></div><div class="col-xs-5 col-sm-4 col-md-3 les_input"><input type="text" class="form-control" name="content" placeholder="Content" /></div><div class="col-xs-1"><button type="button" class="btn btn-default addButton cc_btn" id="remove_'+n_id+'" onclick="remove_lessons('+n_id+')"><i class="fa fa-minus"></i></button></div></div></div>');
       });
    });
    function removeTopic(id){
        $('#removebtn_'+id).parent('div').parent('div').parent('div').remove();
    }
    
    function remove_lessons(id){
        $('#remove_'+id).parent('div').parent('div').remove();
    }
</script>

</body>
</html>
