<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <section>
            <div class="container login">
                <div class="row ">
                    <div class="center span12 well tabbable">
                        <ul id="tabs" class="nav nav-tabs">
                            <li class="active"><a href="#mail" data-toggle="tab">Mail Settings</a></li>
                            <li><a href="#password" data-toggle="tab">Password Settings</a></li>                            
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane active" id="mail">
                                <p>
                                    <form:form action="/settings/mail" modelAttribute="mailSettings" >                                    
                                        <form:errors path="*"> 
                                        <div class="alert alert-error">
                                            <a class="close" data-dismiss="alert" href="#">×</a>
                                            Please fix the errors below
                                        </div>
                                    </form:errors>

                                    <div class="control-group">
                                        <label class="control-label" for="smtpHost"> SMTP Host </label>
                                        <div class="controls">
                                            <form:input path="smtpHost" cssErrorClass="error"/>
                                            <form:errors path="smtpHost">
                                                <span class="help-inline error"><form:errors path="smtpHost" htmlEscape="false" /></span>
                                            </form:errors>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="smtpPort"> SMTP Port </label>
                                        <div class="controls">
                                            <form:input path="smtpPort" cssErrorClass="error"/>
                                            <form:errors path="smtpPort">
                                                <span class="help-inline error"><form:errors path="smtpPort" htmlEscape="false" /></span>
                                            </form:errors>
                                        </div>
                                    </div>

                                    <div class="control-group">                                
                                        <div class="controls">
                                            <label class="checkbox">
                                                StartTLS <form:checkbox id="starttls" path="starttls" cssErrorClass="error"/>
                                                <form:errors path="starttls">
                                                    <span class="help-inline error"><form:errors path="starttls" htmlEscape="false" /></span>
                                                </form:errors>
                                            </label>
                                        </div>
                                    </div>            

                                    <div class="control-group">                                
                                        <div class="controls">
                                            <label class="checkbox">
                                                SMTP Auth <form:checkbox id="smtpAuth" path="smtpAuth" cssErrorClass="error"/>
                                                <form:errors path="smtpAuth">
                                                    <span class="help-inline error"><form:errors path="smtpAuth" htmlEscape="false" /></span>
                                                </form:errors>
                                            </label>
                                        </div>
                                    </div>             

                                    <div class="control-group">
                                        <label class="control-label" for="username"> Username </label>
                                        <div class="controls">
                                            <form:input path="username" cssErrorClass="error"/>
                                            <form:errors path="username">
                                                <span class="help-inline error"><form:errors path="username" htmlEscape="false" /></span>
                                            </form:errors>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="password"> Password </label>
                                        <div class="controls">
                                            <form:password path="password" cssErrorClass="error"/>
                                            <form:errors path="password">
                                                <span class="help-inline error"><form:errors path="password" htmlEscape="false" /></span>
                                            </form:errors>
                                        </div>
                                    </div>        

                                    <div class="control-group">
                                        <label class="control-label" for="fromAddress"> From Address </label>
                                        <div class="controls">
                                            <form:input path="fromAddress" cssErrorClass="error"/>
                                            <form:errors path="fromAddress">
                                                <span class="help-inline error"><form:errors path="fromAddress" htmlEscape="false" /></span>
                                            </form:errors>
                                        </div>
                                    </div>         

                                    <div class="control-group">
                                        <label class="control-label" for="toAddress"> To Address </label>
                                        <div class="controls">
                                            <form:input path="toAddress" cssErrorClass="error"/>
                                            <form:errors path="toAddress">
                                                <span class="help-inline error"><form:errors path="toAddress" htmlEscape="false" /></span>
                                            </form:errors>
                                        </div>
                                    </div>    

                                    <div class="control-group">
                                        <label class="control-label" for="Subject"> Subject </label>
                                        <div class="controls">
                                            <form:input path="subject" cssErrorClass="error"/>
                                            <form:errors path="subject">
                                                <span class="help-inline error"><form:errors path="subject" htmlEscape="false" /></span>
                                            </form:errors>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <div class="controls">
                                            <input type="submit" class="btn" />
                                        </div>
                                    </div>
                                    <form:hidden path="id" />

                                </form:form>
                                </p>
                            </div>


                            <div class="tab-pane" id="password">
                                <p>

                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>



    </body>
</html>
