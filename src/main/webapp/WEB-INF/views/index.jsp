<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html ng-app="anchorotr" ng-controller="AppCtrl">
    <head>     
        <title>The Anchor-OTR</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Glass+Antiqua&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Libre+Baskerville:400,700,400italic' rel='stylesheet' type='text/css'>
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" media="screen" href="<c:url value='/resources/css/responsive.css' />" >
        <link rel="shortcut icon" href="<c:url value='/resources/img/favicon.ico' />" > 
    </head>
    <body>
        <div class="navbar visible-phone visible-tablet hidden-desktop" id="mobile-menubar">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" ng-click="toggleNavMenu()">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <a class="brand" href="#"><i class="icon-anchor"></i>The Anchor-OTR</a>				
                    <div class="nav-collapse collapse" collapse="isNavCollapsed.val">	
                        <ul class="nav">
                            <li class="dropdown">
                                <ul class="nav">
                                    <li ui-route="/menus/lunch" ng-class="{active:$state.params.id==='lunch'}">
                                        <a href="#/menus/lunch"> Lunch Menu </a>
                                    </li>
                                    <li ui-route="/menus/dinner" ng-class="{active:$state.params.id==='dinner'}"> 
                                        <a href="#/menus/dinner"> Dinner Menu </a>
                                    </li>
                                    <li ui-route="/menus/wine" ng-class="{active:$state.params.id==='wine'}">
                                        <a href="#/menus/wine"> Wine List </a>
                                    </li>
                                    <li ui-route="/menus/cocktails" ng-class="{active:$state.params.id==='cocktails'}">
                                        <a href="#/menus/cocktails"> House Cocktails </a>
                                    </li>
                                    <li ui-route="/menus/happyHour" ng-class="{active:$state.params.id==='happyHour'}">
                                        <a href="#/menus/happyHour"> Happy Hour </a>
                                    </li>
                                    <li ui-route="/location" ng-class="{active: $state.includes('location')}">
                                        <a href="#/location"> Location </a>
                                    </li>
                                    <li ui-route="/about" ng-class="{active: $state.includes('about')}">
                                        <a href="#/about">About </a>
                                    </li>
                                    <li ui-route="/reservation" ng-class="{active: $state.includes('reservation')}" >
                                        <a href="#/reservation">Reservations</a>
                                    </li>
                                </ul>			
                            </li>
                        </ul>
                    </div>
                </div>
            </div>	
        </div>	

        <div id="mobile-logo" class="visible-phone visible-tablet hidden-desktop">	
            <div class="row-fluid">
                <div class="span12 text-center">		
                    <a href="#/home"> <img src="/resources/img/AnchorLarge.png" /> </a>
                </div>
                <address class="text-center">
                    1401 Race Street<br/>
                    Cincinnati,OH 45202<br/>
                    (513) 421-8111
                </address>

                <address class="text-center">
                    Tue-Thur: 11:30-2:30, 5-10<br/>
                    Fri-Sat:  11:30-2:30, 5-11
                </address>
            </div>
            <!-- may need to display a different template for the location as the map is really small on a mobile device... -->
            <div style="margin-left:20px;margin-right:20px">	
                <div ui-view="main"> </div>

                <div class="pagefooter" class="row-fluid ui-view">                   
                    <div class="thin-line" > </div>
                    <div class="thick-line"> </div>	
                    <div class="social container">
                        <a href="https://www.facebook.com/theanchorotr" target="_blank">
                            <span class="icon-stack">
                                <i class="icon-circle icon-stack-base"></i>
                                <i class="icon-facebook icon-light"></i>
                            </span>
                        </a>	

                        <a href="https://twitter.com/theanchorotr" target="_blank"> 
                            <span class="icon-stack">
                                <i class="icon-circle icon-stack-base"></i>
                                <i class="icon-twitter icon-light"></i>
                            </span>	
                        </a>

                        <a > 
                            <span class="icon-stack">
                                <i class="icon-circle icon-stack-base"></i>
                                <i class="icon-envelope icon-light"></i>
                            </span>	
                        </a>

                        <security:authorize access="isAnonymous()"> 
                            <a href="<c:url value='/login' />">
                                <span class="icon-stack">
                                    <i class="icon-circle icon-stack-base"></i>
                                    <i class="icon-lock icon-light"></i>
                                </span>
                            </a>
                        </security:authorize>

                        <security:authorize access="isAuthenticated()">
                            <a href="<c:url value='/j_spring_security_logout' />" >
                                <span class="icon-stack">
                                    <i class="icon-circle icon-stack-base"></i>
                                    <i class="icon-unlock icon-light"></i>
                                </span>
                            </a>
                        </security:authorize>

                    </div>
                </div>
            </div>
        </div>

        <div id="desktop-menubar" class="row-fluid hidden-phone hidden-tablet visible-desktop">
            <div class="container">
                <div class="row-fluid" id="logo-row">	
                    <div class="span4 info-columns text-right" id="left-text">
                        <ul class="inline">
                            <li> 1401 Race Street,</li>
                            <li> Cincinnati, OH 45202 </li>
                        </ul>	
                    </div>	
                    <div class="span4 text-center" id="center-logo">
                        <a href="#/home"> <img src="/resources/img/AnchorLarge.png" /> </a>
                    </div>
                    <div class="span4 info-columns" id="right-text">
                        <ul class="inline">
                            <li> (513) 421-8111 </li>
                            <li>
                                <ul class="hours">
                                    <li> Tue-Thur: 11:30-2:30, 5-10 </li>
                                    <li> Fri-Sat: 11:30-2:30, 5-11 </li>
                                </ul>
                            </li>
                        </ul>	
                    </div>
                </div>
            </div>

            <div class="container" id="main-menu" >
                <div class="row-fluid">	
                    <div class="container">
                        <div class="span4" >
                            <ul class="inline text-right">
                                <li ng-class="{active: $state.includes('menus')}"> 
                                    <a href="" ng-click="toggleMenu()">Menu</a>
                                </li>
                                <li ui-route="/location" ng-class="{active: $state.includes('location')}" >
                                    <a href="#/location"> Location </a>
                                </li>
                            </ul>
                        </div>
                        <div class="span4"> </div>	
                        <div class="span4">
                            <ul class="inline text-left">
                                <li ui-route="/about" ng-class="{active: $state.includes('about')}" >
                                    <a href="#/about"> About </a>
                                </li>
                                <li ui-route="/reservation" ng-class="{active: $state.includes('reservation')}">
                                    <a href="#/reservation"> Reservations </a>                      
                                </li>
                            </ul>	
                        </div>
                    </div>
                </div>	
                <div id="submenu" class="row-fluid collapse" collapse="isCollapsed.val">
                    <div class="container">	
                        <ul class="inline">
                            <li ng-class="{active:$state.params.id==='lunch'}" >
                                <a href="#/menus/lunch"> Lunch </a>	
                            </li>
                            <li ng-class="{active:$state.params.id==='dinner'}">
                                <a href="#/menus/dinner"> Dinner </a>
                            </li>	
                            <li ng-class="{active:$state.params.id==='wine'}" >
                                <a href="#/menus/wine" > Wine List </a>
                            </li>
                            <li ng-class="{active:$state.params.id==='cocktails'}">
                                <a href="#/menus/cocktails"> House Cocktails </a>
                            </li>
                            <li ng-class="{active:$state.params.id==='happyHour'}">
                                <a href="#/menus/happyHour"> Happy Hour </a>
                            </li>
                        </ul>	
                    </div>
                </div>	
                <div class="container" id="menu-border"></div>	
                <div ui-view="main"> </div> 
                <div class="pagefooter" class="row-fluid ui-view">
                    <div class="thin-line" > </div>
                    <div class="thick-line"> </div>                    
                    <div class="social container">
                        <a href="https://www.facebook.com/theanchorotr" target="_blank">
                            <span class="icon-stack">
                                <i class="icon-circle icon-stack-base"></i>
                                <i class="icon-facebook icon-light"></i>
                            </span>
                        </a>	
                        <a href="https://twitter.com/theanchorotr" target="_blank"> 
                            <span class="icon-stack">
                                <i class="icon-circle icon-stack-base"></i>
                                <i class="icon-twitter icon-light"></i>
                            </span>	
                        </a>
                        <a > 
                            <span class="icon-stack">
                                <i class="icon-circle icon-stack-base"></i>
                                <i class="icon-envelope icon-light"></i>
                            </span>	
                        </a>
                        <security:authorize access="isAnonymous()"> 
                            <a href="<c:url value='/login' />">
                                <span class="icon-stack">
                                    <i class="icon-circle icon-stack-base"></i>
                                    <i class="icon-lock icon-light"></i>
                                </span>
                            </a>
                        </security:authorize>
                        <security:authorize access="isAuthenticated()">
                            <a href="<c:url value='/j_spring_security_logout' />" >
                                <span class="icon-stack">
                                    <i class="icon-circle icon-stack-base"></i>
                                    <i class="icon-unlock icon-light"></i>
                                </span>
                            </a>
                        </security:authorize>
                    </div>
                </div>
            </div>	
        </div>
        
        <form>
            <input id="baseUrl" type="hidden" value="${pageContext.request.contextPath}/" />
        </form>
        
        <script type="text/javascript" src="<c:url value='/resources/js/vender/angular.min.js'/>"></script>        
        <script type="text/javascript" src="<c:url value='/resources/js/vender/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/vender/angular-resource.min.js' />"></script>
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
    </body>
</html>
