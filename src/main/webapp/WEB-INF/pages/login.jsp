<%@ page language="java" contentType="text/html; charset=utf8"
         pageEncoding="utf8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login Page</title>

    <link rel="stylesheet" href="../../resources/style.css"/>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="../../resources/bootstrap-3.3.4-dist/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="../../resources/bootstrap-3.3.4-dist/css/bootstrap-theme.min.css">


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
    <div id="loginbox" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Sign In</div>
            </div>
            <div class="panel-body login-form">
                <form id="loginform" class="form-horizontal"
                      action="<c:url value='../j_spring_security_check'/>"
                      method="POST">
                    <div class="input-group button-style">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" name="j_username"
                               maxlength="32">
                    </div>
                    <div class="input-group button-style">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input type="password" class="form-control" name="j_password"
                               maxlength="32">
                    </div>
                    <div class="last-button-style">
                        <!-- Button -->
                        <button class="btn btn-success" type="submit">
                            Sign in
                        </button>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div class="registration-text"> Don't have an account?
                                <a href="${pageContext.request.contextPath}/registration">
                                    Sign Up Here
                                </a>
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
