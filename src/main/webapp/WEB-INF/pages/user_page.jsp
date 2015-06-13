<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Personal Page</title>

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
            <div>
                <div class="well">
                    <div class="well well-sm">
                        <div class="row">
                            <div class="col-sm-6 col-md-4">
                                <img src="..//resources/default_user.png"
                                     alt="${pageContext.request.userPrincipal.name}"
                                     class="img-rounded img-responsive"/>
                            </div>
                            <div class="col-sm-6 col-md-8">
                                <h4> Hello,
                                    ${currentUser.username}</h4>
                                <i class="glyphicon glyphicon-envelope"></i>${currentUser.email}
                                <br/>
                            </div>
                        </div>
                    </div>
                    <ul class="nav">
                        <div id="form-for-themes" class="well well-sm">
                            <li class="nav-header"><strong>Your themes:</strong></li>
                            <c:forEach items="${userThemes}" var="theme">
                                <div class="panel media">
                                    <div class="media-body">
                                        <p class="time">Posted: ${theme.date}</p>
                                        <h4 class="media-heading user-comments"><a
                                                href="/themes/${theme.id}">${theme.name}</a>
                                        </h4>
                                    </div>
                                </div>
                                <%--<div><a href="/user/${user.username}">${theme.name}</a></div>--%>
                            </c:forEach>
                        </div>
                        <div id="form-for-comments" class="well well-sm">
                            <li class="nav-header"><strong>Your comments:</strong></li>
                            <c:forEach items="${userComments}" var="comment">
                                <div class="panel media">
                                    <div class="media-body">
                                        <p class="time">Posted: <fmt:formatDate value="${comment.date}"
                                                                                pattern="yyyy-MM-dd HH:mm"/></p>
                                        <h5 id="user-comments" class="media-heading">
                                            <c:set var="fullContent" value="${comment.content}"/>
                                            <c:set var="first30CharactersOfContent"
                                                   value="${fn:substring(fullContent, 0, 30)}"/>
                                                ${comment.user.username}: ${first30CharactersOfContent}<a
                                                href="/themes/${comment.theme.id}">...</a>
                                        </h5>

                                        <p id="theme-name" class="text-right"><strong>Theme: </strong>
                                                <%--<c:set var="fullContent" value="${comment.theme.content}"/>
                                                <c:set var="first30CharactersOfContent"
                                                       value="${fn:substring(fullContent, 0, 30)}"/>--%>
                                            <a href="/themes/${comment.theme.id}">${comment.theme.name}</a>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </ul>
                </div>
                <!--/.well -->
            </div>
            <!--/sidebar-nav-fixed -->
        </div>
        <!--/span-->
        <div class="col-md-8">
            <div class="jumbotron">
                <form role="form" action="${pageContext.request.contextPath}/addTheme" method="POST">
                    <h3 class="text-center">Create Theme</h3>

                    <div class="form-group">
                        <label for="tittle">Theme tittle:</label>

                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Tittle" name="name"
                                   id="tittle" maxlength="128" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="content">Theme content:</label>

                        <div class="form-group">
                    <textarea class="form-control" id="content" name="content"
                              placeholder="Content" rows="3"></textarea>

                            <p></p>

                            <div class="input-group">
                                <input type="submit" name="submit" id="submit" value="Add theme"
                                       class="btn btn-info pull-right">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                </form>
            </div>
        </div>
        <!--/span-->
        <div class="col-md-3">
            <div>
                <!--/.well -->
            </div>
            <!--/sidebar-nav-fixed -->
        </div>
        <!--/span-->
    </div>
    <!--/row-->
</div>

<script src="../../resources/jquery-2.1.4.min.js"></script>
<script src="../../resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
</body>
</html>
