<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="navbar-wrapper">
    <div class="container">

        <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="top-nav">
            <div class="container">
                <div class="navbar-header">

                    <a class="navbar-brand" href="#home">

                        <img src="<c:url value="/resources/images/logo.png"/>" alt="logo">

                    </a><!-- #Logo Ends -->




                </div>


                <div class="col-md-4 navbar-search" >
                    <div class="input-group stylish-input-group">
                        <input type="text" class="form-control"  placeholder="Search" >
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

                        <li class="active"><a href="#works">Home</a></li>
                        <ul class="nav navbar-nav">
                            <li class="dropdown dropdown-large">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categories <b class="caret"></b></a>

                                <ul class="dropdown-menu dropdown-menu-large row">
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img src="<c:url value="/resources/images/glyphicons/glyphicons-69-ruler.png"/>"/> Mathematics</li>
                                            <li><a href="#">Calculus</a></li>
                                            <li><a href="#">Algebra</a></li>
                                            <li><a href="#">Geometry</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header"><img src="<c:url value="/resources/images/glyphicons/glyphicons-87-display.png"/>"/>
                                                IT & Computer science</li>
                                            <li><a href="#">Programming</a></li>
                                            <li><a href="#">Web Design</a></li>
                                            <li><a href="#">Security & Networking</a></li>

                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header"><img src="<c:url value="/resources/images/glyphicons/glyphicons-534-lab.png"/>"/> Chemistry</li>
                                            <li><a href="#">Example 1</a></li>
                                            <li><a href="#">Example 2</a></li>
                                            <li><a href="#">Example 3</a></li>
                                            <li><a href="#">Example 4</a></li>
                                            <li><a href="#">Example 5</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header">Button dropdowns</li>
                                            <li><a href="#">Single button dropdowns</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header">Input groups</li>
                                            <li><a href="#">Basic example</a></li>
                                            <li><a href="#">Sizing</a></li>
                                            <li><a href="#">Checkboxes and radio addons</a></li>
                                            <li class="divider"></li>
                                            <li class="dropdown-header">Navs</li>
                                            <li><a href="#">Tabs</a></li>
                                            <li><a href="#">Pills</a></li>
                                            <li><a href="#">Justified</a></li>
                                        </ul>
                                    </li>
                                    <li class="col-sm-3">
                                        <ul>
                                            <li class="dropdown-header">Navbar</li>
                                            <li><a href="#">Default navbar</a></li>
                                            <li><a href="#">Buttons</a></li>
                                            <li><a href="#">Text</a></li>
                                            <li><a href="#">Non-nav links</a></li>
                                            <li><a href="#">Component alignment</a></li>
                                            <li><a href="#">Fixed to top</a></li>
                                            <li><a href="#">Fixed to bottom</a></li>
                                            <li><a href="#">Static top</a></li>
                                            <li><a href="#">Inverted navbar</a></li>
                                        </ul>
                                    </li>
                                </ul>

                            </li>
                        </ul>
                        <li ><a href="#partners">Become Instructor </a></li>
                        <c:if test="${user == null}" >
                            <li ><a href="#contact" data-toggle="modal" data-target="#myModal" >Log In</a></li>
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
                    ×</button>
                <h4 class="modal-title" id="myModalLabel">
                    Login/Registration</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12" >
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                            <li><a href="#Registration" data-toggle="tab">Registration</a></li>
                        </ul>
                        <!-- Tab panes -->

                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                <c:url value="/login" var="urlLogin"/>
                                <form:form role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="email1" class="col-sm-3 control-label">
                                            Email</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="email1" placeholder="Email" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1" class="col-sm-3 control-label">
                                            Password</label>
                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">
                                        </div>
                                        <div class="col-sm-5">
                                            <button type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 5px">
                                                Submit</button>
                                            <a href="javascript:;">Forgot your password?</a>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                            <div class="tab-pane" id="Registration">
                                <c:url var="regUrl" value="/register"/>
                                <form:form role="form" class="form-horizontal" action="${regUrl}" method="post" commandName="student" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label for="name" class="col-sm-3 control-label">
                                            Full Name</label>
                                        <div class="col-sm-9">
                                            <form:input path="name"  type="text" class="form-control" id="name" placeholder="Full Name" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="userName" class="col-sm-3 control-label">
                                            Email</label>
                                        <div class="col-sm-9">
                                            <form:input path="userName" type="email" class="form-control" id="userName" placeholder="Email" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-sm-3 control-label">
                                            Password</label>
                                        <div class="col-sm-9">
                                            <form:password path="password" class="form-control" id="password" placeholder="Password" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">
                                        </div>
                                        <div class="col-sm-5">
                                            <input type="submit" class="btn btn-primary btn-sm">
                                                Submit</input>
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="button" class="btn btn-default btn-sm">
                                                Cancel</button>
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