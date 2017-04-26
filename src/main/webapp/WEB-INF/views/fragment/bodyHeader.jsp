<%@ page import="org.springframework.ui.Model" %>
<%@ page import="ae.tutorme.model.Student" %>
<%@ page import="java.applet.AppletContext" %>
<%@ page import="ae.tutorme.model.Instructor" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    Instructor instructor = new Instructor();
    Student student = new Student();
    request.setAttribute("instructor", instructor);
    request.setAttribute("student", student);

%>

<jsp:useBean id="Student" class="ae.tutorme.model.Student" scope="request">
    <jsp:setProperty name="student" property="*"/>
</jsp:useBean>
<jsp:useBean id="Instructor" class="ae.tutorme.model.Instructor" scope="request">
    <jsp:setProperty name="instructor" property="*"/>
</jsp:useBean>
<div class="topbar animated fadeInLeftBig"></div>

<div class="navbar-wrapper">
    <div class="container">

        <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="top-nav">
            <div class="container">
                <div class="navbar-header">

                    <a class="navbar-brand" href="#home">

                        <img src="<c:url value="/resources/images/logo.png"/>" alt="logo">

                    </a><!-- #Logo Ends -->


                </div>


                <div class="col-md-4 navbar-search">
                    <div class="input-group stylish-input-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-addon">
                      <button type="submit">
                          <span class="glyphicon glyphicon-search"></span>
                      </button>
                  </span>
                    </div>
                </div>


                <!-- Nav Starts -->
                <div class="navbar-collapse  collapse">
                    <ul class="nav navbar-nav navbar-right scroll">

                        <a href="<c:url value="/" />">
                            <li class="active">Home
                        </a></li>
                        <ul class="nav navbar-nav">
                            <li class="dropdown dropdown-large">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories <b
                                        class="caret"></b></a>

                                <ul class="dropdown-menu dropdown-menu-large row">
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-69-ruler.png"/>"/>
                                                Mathematics
                                            </li>
                                            <li><a href="#">Calculus</a></li>
                                            <li><a href="#">Algebra</a></li>
                                            <li><a href="#">Geometry</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-87-display.png"/>"/>
                                                IT & Computer science
                                            </li>
                                            <li><a href="#">Programming</a></li>
                                            <li><a href="#">Web Design</a></li>
                                            <li><a href="#">Security & Networking</a></li>

                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-595-stethoscope.png"/>"/>
                                                Health & Nutrition
                                            </li>
                                            <li><a href="#">Nutrition</a></li>
                                            <li><a href="#">Health</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-43-pie-chart.png"/>"/>
                                                Business & Finance
                                            </li>
                                            <li><a href="#">Business</a></li>
                                            <li><a href="#">Finance</a></li>
                                            <li><a href="#">Accounting</a></li>
                                            <li><a href="#">Logistics</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-72-book.png"/>"/>Langauges
                                            </li>
                                            <li><a href="#">Arabic</a></li>
                                            <li><a href="#">English</a></li>
                                            <li><a href="#">Japanese</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-65-lightbulb.png"/>"/>Physics
                                            </li>
                                            <li><a href="#">Thermodynamics</a></li>
                                            <li><a href="#">Mechanical</a></li>
                                            <li><a href="#">Electricity and magnetism</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-371-globe-af.png"/>"/>Geography
                                                & history
                                            </li>
                                            <li><a href="<c:url value="/logout"/>">History</a></li>
                                            <li><a href="#">Geography</a></li>
                                            <li><a href="#">Ecology</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-12-camera.png"/>"/>Media
                                            </li>
                                            <li><a href="#">Photography</a></li>
                                            <li><a href="#">Photoshop</a></li>
                                            <li><a href="#">Video editing</a></li>
                                            <li><a href="#">Cinematology</a></li>
                                        </ul>
                                    </li>
                                </ul>

                            </li>
                        </ul>
                        <c:if test="${user == null}">
                            <li><a data-toggle="modal" data-target="#instructorModel">Become Instructor </a></li>
                        </c:if>
                        <c:if test="${user == null}">
                            <li><a href="#contact" data-toggle="modal" data-target="#myModal">Log In</a></li>
                        </c:if>
                        <c:if test="${user != null}">

                            <li><a href="<c:url value="/logout"/>">Logout</a></li>
                        </c:if>

                    </ul>
                </div>
                <!-- #Nav Ends -->

            </div>
        </div>

    </div>
</div>


<!-- login form start-->
<div class="modal fade log-reg-form" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <img src="<c:url value="/resources/images/glyphicons/glyphicons-198-remove-circle.png"/>"/>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Login/Registration</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                            <li><a href="#Registration" data-toggle="tab">Registration</a></li>
                        </ul>
                        <!-- Tab panes -->

                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                <c:url value="/login" var="login"/>
                                <form action="${login}" class="form-horizontal" method="post">
                                    <div class="form-group">
                                        <label for="userName" class="col-sm-3 control-label">
                                            Email</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" name="username" id="userName"
                                                   placeholder="Email"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-3 control-label">
                                            Password</label>
                                        <div class="col-sm-9">
                                            <input type="password" name="password" class="form-control" id="password"
                                                   placeholder="Password"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="submit" class="btn btn-primary btn-sm"
                                                   style="margin-bottom: 5px"/>
                                            <a href="javascript:;">Forgot your password?</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                                    <div class="tab-pane" id="Registration">
                                        <c:url var="regUrl" value="/register/student"/>

                                        <form:form role="form" class="form-horizontal" action="${regUrl}" method="post"
                                                   commandName="Student">
                                            <div class="form-group">
                                                <label for="name" class="col-sm-3 control-label">
                                                    Full Name</label>
                                                <div class="col-sm-9">
                                                    <form:input path="name" type="text" class="form-control" id="name"
                                                                placeholder="Full Name"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="userName" class="col-sm-3 control-label">
                                                    Email</label>
                                                <div class="col-sm-9">
                                                    <form:input path="userName" type="email" class="form-control"
                                                                id="userName" placeholder="Email"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="password" class="col-sm-3 control-label">
                                                    Password</label>
                                                <div class="col-sm-9">
                                                    <form:password path="password" class="form-control" id="password"
                                                                   placeholder="Password"/>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-3">
                                                </div>
                                                <div class="col-sm-5">
                                                    <input type="submit" class="btn btn-primary btn-sm"/>
                                                </div>
                                                <div class="col-sm-2">
                                                    <button type="button" class="btn btn-default btn-sm">
                                                        Cancel
                                                    </button>
                                                </div>
                                            </div>
                                        </form:form>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- instructor form -->
<div class="modal fade log-reg-form" id="instructorModel" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <img src="<c:url value="/resources/images/glyphicons/glyphicons-198-remove-circle.png"/>"/>
                </button>
                <h4 class="modal-title" id="instructorLabel">
                    Become an instructor</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Registration" data-toggle="tab">Registration</a></li>
                        </ul>
                        <!-- Tab panes -->

                                <div class="tab-pane" id="Registration">
                                    <c:url var="instructorReg" value="/register/instructor"/>

                                    <form:form role="form" class="form-horizontal" action="${instructorReg}" method="post"
                                               commandName="Instructor">
                                        <div class="form-group">
                                            <label for="name" class="col-sm-3 control-label">
                                                Full Name</label>
                                            <div class="col-sm-9">
                                                <form:input path="name" type="text" class="form-control" id="name"
                                                            placeholder="Full Name"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userName" class="col-sm-3 control-label">
                                                Email</label>
                                            <div class="col-sm-9">
                                                <form:input path="userName" type="email" class="form-control"
                                                            id="userName" placeholder="Email"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-sm-3 control-label">
                                                Password</label>
                                            <div class="col-sm-9">
                                                <form:password path="password" class="form-control" id="password"
                                                               placeholder="Password"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                            </div>
                                            <div class="col-sm-5">
                                                <input type="submit" class="btn btn-primary btn-sm"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <button type="button" class="btn btn-default btn-sm">
                                                    Cancel
                                                </button>
                                            </div>
                                        </div>
                                    </form:form>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>