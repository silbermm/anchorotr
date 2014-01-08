<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<div class="pagefooter" class="row-fluid ui-view" ng-controller='AppCtrl' style="padding-bottom:20px">                   
    <div class="thin-line" > </div>
    <div class="thick-line"> </div>	
    <div class="social container">
        <a href="https://www.facebook.com/theanchorotr" target="_blank">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
            </span>
        </a>	
        <a href="https://twitter.com/theanchorotr" target="_blank"> 
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
            </span>	
        </a>
        <a ng-click="openMailModal()"> 
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-envelope fa-stack-1x fa-inverse"></i>
            </span>	
        </a>
        <a href="/login" n ng-if="!isAuthenticated">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-lock fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        <a href="/settings" ng-if="isAuthenticated">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-gears fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        <a href="/j_spring_security_logout" ng-if="isAuthenticated">
            <span class="fa-stack fa-lg">
                <i class="fa fa-circle fa-stack-2x"></i>
                <i class="fa fa-unlock fa-stack-1x fa-inverse"></i>
            </span>
        </a>
    </div>
</div>

<script type="text/ng-template" id="mailModal.html">
    <div class="modal-header">
    <h3>Contact Us</h3>
    </div>
    <div class="modal-body">
    <p> We love hearing from our customers! Send us an email at info@theanchor-otr.com or simply fill out the form below. </p>
    <br />
    <hr>

    <form name="form" class="form-horizontal css-form"> 
    <div class="control-group">
    <label class="control-label" for="from">Your Email (optional): </label>
    <div class="controls">
    <input type="text" id="from" placeholder="From" ng-model="mail.from">
    </div>
    </div>
    <div class="control-group">
    <label class="control-label" for="message">Message</label>
    <div class="controls">
    <textarea rows='10' id="message" placeholder="Your Message..." ng-model="mail.message" required></textarea>                    
    </div>
    </div>        
    </form>                       

    </div>
    <div class="modal-footer">
    <button class="btn btn-primary" ng-disabled="form.$invalid" ng-click="ok()">OK</button>
    <button class="btn btn-warning" ng-click="cancel()">Cancel</button>
    </div>                        
</script>
<script type="text/ng-template" id="mailThanksModal.html">
    <div class="modal-header">
    <h3>Thank You!</h3>
    </div>
    <div class="modal-body">
    <p> Your email has been sent. Thank you for your feedback and questions! </p>                 
    </div>
    <div class="modal-footer">
    <button class="btn btn-primary" ng-click="cancel()">Close</button>      
    </div>                        
</script>