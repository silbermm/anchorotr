<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Anchor-OTR Administration Settings </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link rel="stylesheet" media="screen" href="<c:url value='/resources/css/main.css' />">
        <link rel="shortcut icon" type="image/png" href="<c:url value='img/favicon.png' />">
        <script type="text/javascript" src="<c:url value='/resources/js/common.min.js' />"></script>       
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
                                            <form:errors path="smtpHost" cssErrorClass="help-inline error" htmlEscape="false">
                                            </form:errors>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="smtpPort"> SMTP Port </label>
                                        <div class="controls">
                                            <form:input path="smtpPort" cssErrorClass="error"/>
                                            <form:errors path="smtpPort" cssErrorClass="help-inline error" htmlEscape="false">                                                
                                            </form:errors>
                                        </div>
                                    </div>

                                    <div class="control-group">                                
                                        <div class="controls">
                                            <label class="checkbox">
                                                StartTLS <form:checkbox id="starttls" path="starttls" cssErrorClass="error"/>
                                                <form:errors path="starttls" cssErrorClass="help-inline error" htmlEscape="false">
                                                </form:errors>
                                            </label>
                                        </div>
                                    </div>            

                                    <div class="control-group">                                
                                        <div class="controls">
                                            <label class="checkbox">
                                                SMTP Auth <form:checkbox id="smtpAuth" path="smtpAuth" cssErrorClass="error"/>
                                                <form:errors path="smtpAuth" cssErrorClass="help-inline error" htmlEscape="false">
                                                </form:errors>
                                            </label>
                                        </div>
                                    </div>             

                                    <div class="control-group">
                                        <label class="control-label" for="username"> Username </label>
                                        <div class="controls">
                                            <form:input path="username" cssErrorClass="error"/>
                                            <form:errors path="username"cssErrorClass="help-inline error" htmlEscape="false">
                                            </form:errors>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label" for="password"> Password </label>
                                        <div class="controls">
                                            <form:password path="password" cssErrorClass="error"/>
                                            <form:errors path="password">
                                            </form:errors>
                                        </div>
                                    </div>        

                                    <div class="control-group">
                                        <label class="control-label" for="fromAddress"> From Address </label>
                                        <div class="controls">
                                            <form:input path="fromAddress" cssErrorClass="error"/>
                                            <form:errors path="fromAddress">
                                            </form:errors>
                                        </div>
                                    </div>         

                                    <div class="control-group">
                                        <label class="control-label" for="toAddress"> To Address </label>
                                        <div class="controls">
                                            <form:input path="toAddress" cssErrorClass="error"/>
                                            <form:errors path="toAddress">
                                            </form:errors>
                                        </div>
                                    </div>    

                                    <div class="control-group">
                                        <label class="control-label" for="Subject"> Subject </label>
                                        <div class="controls">
                                            <form:input path="subject" cssErrorClass="error"/>
                                            <form:errors path="subject">
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
