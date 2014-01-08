<%-- 
    Document   : login
    Created on : Sep 9, 2013, 8:42:17 AM
    Author     : silbermm
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>     
        <title> Login | The Anchor-OTR </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Glass+Antiqua&subset=latin,latin-ext' rel='stylesheet' type='text/css'>        
        <link rel="stylesheet" media="screen" href="<c:url value='/resources/css/main.css' />">
        <link rel="shortcut icon" type="image/png" href="<c:url value='img/favicon.png' />">
    </head>
    <body>
        <div id="mobile-logo">
            <div class="row-fluid">
                <div class="span12 text-center">		
                    <a href="/"> <img src="/resources/img/AnchorLarge.png" /> </a>
                </div>
            </div>
        </div>

        <c:url var="postLoginUrl" value="/j_spring_security_check" />
        <section>
            <div class="container login">
                <div class="row ">
                    <div class="center span4 well">
                        <legend>Please Sign In</legend>
                        <c:if test="${not empty error}">
                            <div class="alert alert-error">
                                <a class="close" data-dismiss="alert" href="#">×</a>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                            </div>
                        </c:if>
                        <form method="POST" accept-charset="UTF-8" action="${postLoginUrl}" >
                            <input type="text" id="username" class="span4" name='j_username' placeholder="Username" />
                            <input type="password" id="password" class="span4" name='j_password' placeholder="Password" />
                            <input type="hidden" name='_spring_security_remember_me' value='1' />
                            <button type="submit" name="submit" class="btn btn-primary btn-block">Sign in</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
