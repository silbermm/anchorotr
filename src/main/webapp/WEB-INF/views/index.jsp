<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html ng-app="anchorotr" ng-controller="AppCtrl">
<head>
  <title>The Anchor-OTR</title>
  <meta name="fragment" content="!" />
  <%@ include file="common/header.jsp" %>
</head>
<body> 
<div growl></div> 
  <div id="desktop-menubar" class="row-fluid"> 
    <%@ include file="common/navigation.jsp" %> 
  </div>
  <script type="text/javascript" src="<c:url value='/resources/js/common.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/templates.js' />"></script>
  <!-- 
  <script type="text/javascript" src="<c:url value='/assets/js/vender/imagesLoaded.js'/>"></script> 
  <script type="text/javascript" src="<c:url value='/resources/js/vender/masonry.min.js'/>"></script> 
  <script type="text/javascript" src="<c:url value='/resources/js/vender/angular.min.js'/>"></script>        
  <script type="text/javascript" src="<c:url value='/resources/js/vender/angular-masonry.min.js'/>"></script>        
  <script type="text/javascript" src="<c:url value='/resources/js/vender/bootstrap.min.js'/>"></script>        
  <script type="text/javascript" src="<c:url value='/resources/js/vender/angular-growl.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/vender/angulartics.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/vender/angulartics-google-analytics.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/vender/ui-bootstrap-tpls-0.6.0.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/vender/ui-route.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/vender/ui-utils.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/app.js' />"></script>        
  <script type="text/javascript" src="<c:url value='/resources/js/services/titleService.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/services/menuCollapseService.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/services/navCollapseService.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/services/authService.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/home/home.js' />"></script> 
  <script type="text/javascript" src="<c:url value='/resources/js/about/about.js' />"></script> 
  <script type="text/javascript" src="<c:url value='/resources/js/location/location.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/menus/menus.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/js/reservation/reservation.js' />"></script>   
   -->
</body>
</html>
