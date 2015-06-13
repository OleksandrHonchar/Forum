<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Forum</title>
    <link rel="stylesheet" href="../../resources/style.css"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="../../resources/bootstrap-3.3.4-dist/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="../../resources/bootstrap-3.3.4-dist/css/bootstrap-theme.min.css">


</head>
<body>
<!-- navbar for sign in -->
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

<h1 class="container text-right"><a href="${pageContext.request.contextPath}/personal_page">
    <button type="submit" class="btn btn-default ">Create a new theme</button>
</a></h1>


<c:forEach items="${themes}" var="theme">
    <div class="container">
        <div class="row">
            <div>
                <div id="forum">
                    <div class="panel">
                        <div class="panel-heading">
                            <div class="text-left">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h3 class="pull-left full-width"><a href="/themes/${theme.id}">${theme.name}</a>
                                        </h3>
                                    </div>
                                    <div class="col-sm-9"><h5 class="pull-left">Posted by: <a
                                            href="/user/${theme.user.username}">${theme.user.username}</a></h5>
                                    </div>
                                    <div class="col-sm-3">
                                        <h4 class="pull-right">
                                            <small><em>${theme.date}</em></small>
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:set var="fullContent" value="${theme.content}"/>
                            <c:set var="first355CharactersOfContent" value="${fn:substring(fullContent, 0, 355)}"/>
                                ${first355CharactersOfContent}... <a href="/themes/${theme.id}">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<script src="../../resources/jquery-2.1.4.min.js"></script>
<script src="../../resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
</body>
</html>
