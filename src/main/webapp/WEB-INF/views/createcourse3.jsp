<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="fragment/header.jsp"%>

</head>

<body>
<%@include file="fragment/bodyHeader.jsp"%>
-----------------------------------------
<!-- #Sarch -->
<div class="container" style="background:rgba(255,255,255,0.8); padding-top:100px; padding-bottom:20px; ">



    <c:url var="regUrl" value="/register"/>

    <form:form role="form" class="form-horizontal" action="${regUrl}" method="post" commandName="createcourse" >
        <h1>Course information: </h1>
        <div class="form-group">
            <label for="name" class="col-sm-6 control-label">
                Full Name</label>
            <div class="col-sm-9">
                <form:input path="name"  type="text" class="form-control" id="name" placeholder="Full Name" />
            </div>
        </div>

        <div class="form-group">
            <label for="name" class="col-sm-6 control-label">
                Full Name</label>
            <div class="col-sm-9">
                <form:textarea path="description"  rows="5" cols="30" class="form-control" id="name" placeholder="Full Name" />
            </div>
        </div>


    </form:form>



</div>
<!-- custom script -->
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
