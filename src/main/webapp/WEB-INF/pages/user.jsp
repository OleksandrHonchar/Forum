<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>${user.username} page</title>

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
    <div class="row">
        <div class="col-md-4">
            <div class="well well-sm">
                <div class="panel">
                    <div class="row">
                        <div class="col-sm-6 col-md-4">
                            <img src="..//resources/default_user.png" alt="${user.username}"
                                 class="img-rounded img-responsive"/>
                        </div>
                        <div class="col-sm-6 col-md-8">
                            <h4>
                                ${user.username}</h4>

                            <p><i class="glyphicon glyphicon-envelope"></i>${user.email}</p>
                        </div>
                    </div>
                </div>
                <div id="form-for-comments" class="well well-sm">
                    <h3 class="text-center">${user.username}'s comments:</h3>
                    <c:forEach items="${userComments}" var="comment">
                        <div class="panel media">
                            <div class="media-body">
                                <p class="time">Posted <fmt:formatDate value="${comment.date}"
                                                                       pattern="yyyy-MM-dd HH:mm"/></p>
                                <h5 class="media-heading user-comments">
                                    <c:set var="fullContent" value="${comment.content}"/>
                                    <c:set var="first25CharactersOfContent"
                                           value="${fn:substring(fullContent, 0, 25)}"/>
                                        ${first25CharactersOfContent}... <a href="/themes/${comment.theme.id}">Show
                                    more</a>

                                    <p></p>

                                    <p id="theme-name" class="text-right"><strong>Theme: </strong><a
                                            href="/themes/${comment.theme.id}">${comment.theme.name}</a></p>
                                </h5>
                            </div>
                        </div>
                        <%--<div><a href="/user/${user.username}">${theme.name}</a></div>--%>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="row">
                <div id="form-for-themes" class="well well-sm">
                    <h3 class="text-center">${user.username}'s themes:</h3>
                    <c:forEach items="${userThemes}" var="theme">
                        <div class="panel">
                            <div class="panel-heading">
                                <div class="text-left">
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <h4 class="pull-left"><a href="/themes/${theme.id}">${theme.name}</a></h4>
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
                                <c:set var="first240CharactersOfContent" value="${fn:substring(fullContent, 0, 240)}"/>
                                    ${first240CharactersOfContent}<a href="/themes/${theme.id}">...</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="../../resources/jquery-2.1.4.min.js"></script>
<script src="../../resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
</body>
</html>
