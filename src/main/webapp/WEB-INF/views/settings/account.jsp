<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Anchor-OTR Administration Settings </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" media="screen" href="<c:url value='/resources/css/responsive.css' />">
        <link rel="shortcut icon" type="image/png" href="<c:url value='img/favicon.png' />">
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/vender/bootstrap.min.js'/>"></script>         
    </head>
    <body>
        <div id="mobile-logo">
            <div class="row-fluid">
                <div class="span12 text-center">		
                    <a href="/"> <img src="/resources/img/AnchorLarge.png" /> </a>
                </div>
            </div>
        </div>
    <body>
        <section>
            <div class="container login">                                              
                <div class="row ">
                    <div class="center span12 well tabbable">
                        <ul id="tabs" class="nav nav-tabs">
                            <li><a href="<c:url value='/settings/mail' />">Mail Settings</a></li>
                            <li class="active"><a href="<c:url value='/settings/account' />">Account Settings</a></li>                            
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane active" id="account">
                                <p>
                                    <form:form action="account" modelAttribute="accountSettings" class="form-horizontal">    
                                        <c:if test="${not empty mesg}">                                            
                                        <div class="alert alert-success">
                                            <a class="close" data-dismiss="alert" href="#">×</a>
                                            ${mesg}
                                        </div>
                                    </c:if>
                                    <form:errors path="*"> 
                                        <div class="alert alert-error">
                                            <a class="close" data-dismiss="alert" href="#">×</a>
                                            Please fix the errors below
                                        </div>
                                    </form:errors>                                   

                                    <div class="control-group">
                                        <label class="control-label" for="password"> New Password </label>
                                        <div class="controls">
                                            <form:password path="password" cssErrorClass="error"/>
                                            <form:errors path="password" cssErrorClass="help-inline error" htmlEscape="false">                                                
                                            </form:errors>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="confirmPassword"> Confirm Password </label>
                                        <div class="controls">
                                            <form:password path="confirmPassword" cssErrorClass="error"/>
                                            <form:errors path="confirmPassword" cssErrorClass="help-inline error" htmlEscape="false">                                                
                                            </form:errors>
                                        </div>
                                    </div>                                         

                                    <div class="control-group">
                                        <div class="controls">
                                            <input type="submit" class="btn" />
                                        </div>
                                    </div>                                    
                                </form:form>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
