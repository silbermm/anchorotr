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
  <script type="text/javascript" src="<c:url value='/resources/js/common.min.js' />"></script>
  <!-- <script type="text/javascript" src="<c:url value='/resources/js/common.js' />"></script> 
  <script type="text/javascript" src="<c:url value='/resources/js/templates.js' />"></script> -->
</body>
</html>
