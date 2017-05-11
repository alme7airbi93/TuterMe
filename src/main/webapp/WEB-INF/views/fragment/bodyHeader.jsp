<%@ page import="ae.tutorme.model.Student" %>
<%@ page import="ae.tutorme.model.Instructor" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

                    Language : <a href="<c:url value="?lang=en" />">English</a>|<a href="<c:url value="?lang=ar" />">Arabic</a>

                </div>

                <div class="navbar-header">
                

                    <a class="navbar-brand" href="#home">

                        <img src="<c:url value="/resources/images/logo.png"/>" alt="logo">

                    </a><!-- #Logo Ends -->


                </div>


                <div class="col-md-4 navbar-search">
                    <form action="<c:url value="/search"/> " method="GET">
                    <div class="input-group stylish-input-group">
                        <input name="search" type="text" class="form-control" placeholder="Search">
                        <span class="input-group-addon">
                      <input hidden type="submit">
                          <span class="glyphicon glyphicon-search"></span>
                      </input>
                  </span>
                    </div>
                    </form>
                </div>


                <!-- Nav Starts -->
                <div class="navbar-collapse  collapse">
                    <ul class="nav navbar-nav navbar-right scroll">
                    <div id="google_translate_element"></div>


                        <li > <a href="<c:url value="/" />"><spring:message code="label.home" text="Home"/> </a></li>
                        <ul class="nav navbar-nav">
                            <li class="dropdown dropdown-large">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories <b
                                        class="caret"></b></a>

                                <ul class="dropdown-menu dropdown-menu-large row">
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img href="<c:url value="/search?search=mathematics"/>"
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-69-ruler.png"/>"/>
                                                Mathematics
                                            </li>
                                            <li><a href="<c:url value="/search?search=calculus"/> ">Calculus</a></li>
                                            <li><a href="<c:url value="/search?search=algebra"/>">Algebra</a></li>
                                            <li><a href="<c:url value="/search?search=geometry"/>">Geometry</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img href="<c:url value="/search?search=computer"/>"
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-87-display.png"/>"/>
                                                IT & Computer science
                                            </li>
                                            <li><a href="<c:url value="/search?search=programming"/>">Programming</a></li>
                                            <li><a href="<c:url value="/search?search=web Design"/>">Web Design</a></li>
                                            <li><a href="<c:url value="/search?search=security"/>">Security & Networking</a></li>

                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img href="<c:url value="/search?search=health"/>"
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-595-stethoscope.png"/>"/>
                                                Health & Nutrition
                                            </li>
                                            <li><a href="<c:url value="/search?search=nutrition"/>">Nutrition</a></li>
                                            <li><a href="<c:url value="/search?search=health"/>">Health</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img href="<c:url value="/search?search=business"/>"
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-43-pie-chart.png"/>"/>
                                                Business & Finance
                                            </li>
                                            <li><a href="<c:url value="/search?search=business"/>">Business</a></li>
                                            <li><a href="<c:url value="/search?search=finance"/>">Finance</a></li>
                                            <li><a href="<c:url value="/search?search=accounting"/>">Accounting</a></li>
                                            <li><a href="<c:url value="/search?search=logistics"/>">Logistics</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img href="<c:url value="/search?search=langauges"/>"
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-72-book.png"/>"/>Langauges
                                            </li>
                                            <li><a href="<c:url value="/search?search=arabic"/>">Arabic</a></li>
                                            <li><a href="<c:url value="/search?search=english"/>">English</a></li>
                                            <li><a href="<c:url value="/search?search=japanese"/>">Japanese</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img href="<c:url value="/search?search=physics"/>"
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-65-lightbulb.png"/>"/>Physics
                                            </li>
                                            <li><a href="<c:url value="/search?search=thermodynamics"/>">Thermodynamics</a></li>
                                            <li><a href="<c:url value="/search?search=mechanical"/>">Mechanical</a></li>
                                            <li><a href="<c:url value="/search?search=electricity"/>">Electricity and magnetism</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img href="<c:url value="/search?search=history"/>"
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-371-globe-af.png"/>"/>Geography
                                                & history
                                            </li>
                                            <li><a href="<c:url value="/search?search=history"/>">History</a></li>
                                            <li><a href="<c:url value="/search?search=geography"/>">Geography</a></li>
                                            <li><a href="<c:url value="/search?search=ecology"/>">Ecology</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img href="<c:url value="/search?search=media"/>"
                                                    src="<c:url value="/resources/images/glyphicons/glyphicons-12-camera.png"/>"/>Media
                                            </li>
                                            <li><a href="<c:url value="/search?search=photography"/>">Photography</a></li>
                                            <li><a href="<c:url value="/search?search=photoshop"/>">Photoshop</a></li>
                                            <li><a href="<c:url value="/search?search=video"/>">Video editing</a></li>
                                            <li><a href="<c:url value="/search?search=cinematology"/>">Cinematology</a></li>
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
                        <c:if test="${user.authorization.role == 'ROLE_STUDENT' }">

                            <li><a href="<c:url value="/student/mycourses"/>">My Courses</a></li>
                        </c:if>
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
                                    <div class="form-group">
                                        <label for="rememberMe" class="col-sm-3 control-label">
                                            Remember me :</label>
                                        <div class="col-sm-9">
                                            <input id="rememberMe" type="checkbox" name="remember-me" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 5px"/>
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


