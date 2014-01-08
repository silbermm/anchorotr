
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <title>New User Registration</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="" />
        <meta name="author" content="Matt Silbernagel" />
        <link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet" />
        <link href="https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet" />
        <link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet" />
        <script type="text/javascript" src="<c:url value='/resources/js/common.min.js' />"></script>
    </head>
    <body>
        <section>
            <div class="container login">
                <div class="row ">
                    <div class="center span4 well">
                        <legend> Please Enter all required information </legend>
                        <c:if test="${not empty error}">
                            <div class="alert alert-error">
                                <a class="close" data-dismiss="alert" href="#">×</a>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                            </div>
                        </c:if>
                        <form:form action="." modelAttribute="account">
                            <form:input path="username" class="span4" placeholder="Username" />
                            <form:password path="password" class="span4" placeholder="Password" />
                            <form:password path="confirmPassword" class="span4" placeholder="Confirm Password" />
                            <form:input path="email" class="span4" placeholder="Email Address" />
                            <form:input path="firstName" class="span4" placeholder="First Name" />
                            <form:input path="lastName" class="span4" placeholder="Last Name" />
                            <button type="submit" name="submit" class="btn btn-primary btn-block">Register</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
