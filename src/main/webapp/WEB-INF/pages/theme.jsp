<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>${theme.name}</title>
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

<!-- Page Content -->
<div class="container">
    <div class="row">
        <!-- Blog Post Content Column -->
        <div class="col-lg-8">
            <!-- Blog Post -->
            <!-- Title -->
            <h1>${theme.name}</h1>
            <!-- Author -->
            <p class="lead">
                by <a href="/user/${theme.user.username}">${theme.user.username}</a>
            </p>
            <hr>
            <!-- Date/Time -->
            <p><span class="glyphicon glyphicon-time"></span> Posted on ${theme.date}</p>
            <hr>
            <!-- Post Content -->
            <pre id="theme-content">
                ${theme.content}
            </pre>
            <hr>
            <!-- Blog Comments -->
            <!-- Comments Form -->
            <sec:authorize access="isAuthenticated()">
                <form action="/themes/${theme.id}/addComment" method="POST">
                    <div class="well">
                        <h4>Leave a Comment:</h4>

                        <div class="form-group">
                            <textarea class="form-control" name="content" rows="3"></textarea>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                        <input type="submit" class="btn btn-default" value="Submit"/>
                    </div>
                </form>
            </sec:authorize>
<sec:authorize access="isAnonymous()">
    <div class="well">
        <h4>To leave comments you must  <a href="${pageContext.request.contextPath}/login"
                                           class="btn btn-default btn-outline btn-circle collapsed">Sign in</a></h4>

    </div>
</sec:authorize>

            <hr>
            <!-- Posted Comments -->
            <!-- Comment -->
            <c:forEach items="${comments}" var="comment">
                <div id="comments" class="panel media">
                    <a class="pull-left" href="/user/${comment.user.username}">
                        <img id="user-img-comment" class="media-object" src="..//resources/default_user.png"
                             alt="${comment.user.username}">
                    </a>

                    <div class="media-body">
                        <h4 class="media-heading"><a
                                href="/user/${comment.user.username}">${comment.user.username}</a>
                            <small><em><fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm"/></em></small>
                        </h4>
                            ${comment.content}
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>
</div>
<!-- /.container -->

</form>
<script src="../../resources/jquery-2.1.4.min.js"></script>
<script src="../../resources/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
</body>
</html>
