<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <link rel="stylesheet" href="../../resources/style.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="../../resources/bootstrap-3.3.4-dist/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="../../resources/bootstrap-3.3.4-dist/css/bootstrap-theme.min.css">


    <title><spring:message code="label.registerTitle"/></title>
</head>
<body>

<!-- navbar for sign in -->
<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#navbar-collapse-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
                    src="..//resources/logo.gif"
                    alt="Forum"/></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-2">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/">Home page</a></li>
                <li><a href="${pageContext.request.contextPath}/personal_page">Personal page</a></li>
                <li>
                    <sec:authorize access="isAnonymous()">
                        <a href="${pageContext.request.contextPath}/login"
                           class="btn btn-default btn-outline btn-circle collapsed">Sign in</a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <c:url var="logoutUrl" value="/logout"/>
                        <form action="${logoutUrl}" method="post">
                            <input type="submit" class="btn btn-default btn-outline btn-circle collapsed"
                                   value="Log out"/>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </sec:authorize>
                </li>
            </ul>
            <div class="collapse nav navbar-nav nav-collapse slide-down" id="nav-collapse2">
            </div>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<!-- /.navbar -->


<div class="container">
    <div id="signupbox"
         class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Sign Up</div>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" action="${pageContext.request.contextPath}/add" method="post">
                    <div class="form-group">
                        <label for="username" class="col-md-3 control-label">Username</label>

                        <div class="col-md-9">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Username"
                                   maxlength="32" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-md-3 control-label">Email</label>

                        <div class="col-md-9">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email Address"
                                   maxlength="32" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label">Password</label>

                        <div class="col-md-9">
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Password" maxlength="32" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-offset-3 col-md-9">
                            <button id="btn-signup" type="submit" class="btn btn-info"><i class="icon-hand-right"></i>
                                Sign Up
                            </button>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-9">
                            <div class="registration-text">
                                Already have an account?
                                <a href="${pageContext.request.contextPath}/login">Sign In</a>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="../../resources/jquery-2.1.4.min.js"></script>
<script src="../../resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
</body>
</html>
