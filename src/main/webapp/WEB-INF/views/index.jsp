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
        <link rel="stylesheet" media="screen" href="<c:url value='/resources/css/datepicker.css' />" >
        <link rel="shortcut icon" href="<c:url value='/resources/img/favicon.ico' />" > 
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/vender/angular.min.js'/>"></script>        
        <script type="text/javascript" src="<c:url value='/resources/js/vender/bootstrap.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/vender/angular-resource.min.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/vender/ui-bootstrap-0.5.0.min.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/vender/ui-route.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/vender/ui-utils.min.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/vender/underscore.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/app.js' />"></script>        
        <script type="text/javascript" src="<c:url value='/resources/js/services/titleService.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/services/searchService.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/home/home.js' />"></script> 
        <script type="text/javascript" src="<c:url value='/resources/js/about/about.js' />"></script> 
        <script type="text/javascript" src="<c:url value='/resources/js/location/location.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/menus/menus.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/reservation/reservation.js' />"></script>
    </head>
    <body>
        <div class="navbar visible-phone visible-tablet hidden-desktop" id="mobile-menubar">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>

                    <a class="brand" href="#"><i class="icon-anchor"></i>The Anchor-OTR</a>				
                    <div class="nav-collapse collapse">	
                        <ul class="nav">
                            <li class="dropdown">
                                <ul class="nav">
                                    <li ui-route="/menus/lunch" ng-class="{active:$state.params.name == lunch}">
                                        <a href="#/menus/lunch"> Lunch Menu </a>
                                    </li>
                                    <li ui-route="/menus/dinner" ng-class="{active:$state.params.name == dinner}"> 
                                        <a href="#/menus/dinner"> Dinner Menu </a>
                                    </li>
                                    <li ui-route="/menus/wine" ng-class="{active:$state.params.name == wine}">
                                        <a href="#/menus/wine"> Wine List </a>
                                    </li>
                                    <li ui-route="/menus/cocktails" ng-class="{active:$state.params.name == cocktails}">
                                        <a href="#/menus/cocktails"> House Cocktails </a>
                                    </li>
                                    <li ui-route="/menus/happyHour" ng-class="{active:$state.params.name == happyHour}">
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
                            <a href="#/login" >
                                <span class="icon-stack">
                                    <i class="icon-circle icon-stack-base"></i>
                                    <i class="icon-lock icon-light"></i>
                                </span>
                            </a>
                        </security:authorize>

                        <security:authorize access="isAuthenticated()">
                            <a href="#/logout   " >
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
                                    <!-- <li> Open daily at 1pm </li> -->
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
                                    <a href="">Menus</a>
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
                <div id="submenu" class="row-fluid collapse">
                    <div class="container">	
                        <ul class="inline">
                            <li ng-class="{active:$state.params.name == lunch}" >
                                <a href="#/menus/lunch"> Lunch </a>	
                            </li>
                            <li ng-class="{active:$state.params.name == dinner}">
                                <a href="#/menus/dinner"> Dinner </a>
                            </li>	
                            <li ng-class="{active:$state.params.name == wine}" >
                                <a href="#/menus/wine" > Wine List </a>
                            </li>
                            <li ng-class="{active:$state.params.name == cocktails}">
                                <a href="#/menus/cocktails"> House Cocktails </a>
                            </li>
                            <li ng-class="{active:$state.params.name == happyHour}">
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
                            <a href="#/login" >
                                <span class="icon-stack">
                                    <i class="icon-circle icon-stack-base"></i>
                                    <i class="icon-lock icon-light"></i>
                                </span>
                            </a>
                        </security:authorize>
                        <security:authorize access="isAuthenticated()">
                            <a href="#/logout   " >
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

        <!-- Modal -->
                <!--

        <div id="removeItemModal" data-bind="with:menuViewModel" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="removeItemModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="removeItemModalLabel">Are you sure?</h3>
            </div>
            <div class="modal-body">
                <p>This will remove <span data-bind="text:deleteObjectName"></span> from the database. Are you sure you want to do this?</p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
                <button class="btn btn-primary" data-bind="click:actuallyDelete">Yes</button>
            </div>
        </div>

        <div id="addItemModal" data-bind="with:menuViewModel" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="addItemModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="addItemModalLabel">Add a new Menu Item</h3>
            </div>
            <div class="modal-body">

                <form class="form-horizontal"> 
                    <div class="control-group">
                        <label class="control-label" for="itemName">Name</label>
                        <div class="controls">
                            <input type="text" id="itemName" data-bind="value:addMenuObject().itemname" placeholder="Name">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="itemDesc">Description (Optional)</label>
                        <div class="controls">
                            <input type="text" id="itemDesc" data-bind="value:addMenuObject().itemdesc" placeholder="Description...">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="itemCatagory">Catagory</label>
                        <div class="controls">
                            <input type="text" id="itemCatagory" data-bind="value:addMenuObject().catagory" disabled >
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="itemPrice">Price</label>
                        <div class="controls">
                            <input type="text" id="itemPrice" data-bind="value:addMenuObject().price" >
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true" data-bind="click: cancelAdd">Cancel</button>
                <button class="btn btn-primary" data-bind="click:actuallyAdd">Create</button>
            </div>
        </div>

        <div id="editItemModal" data-bind="with:menuViewModel" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="editItemModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="editItemModalLabel">Edit <span data-bind='text:editObject().itemname'></span> </h3>
            </div>
            <div class="modal-body">
    
                <form class="form-horizontal"> 
                    <div class="control-group">
                        <label class="control-label" for="itemName">Name</label>
                        <div class="controls">
                            <input type="text" id="itemName" data-bind="value:editObject().itemname" placeholder="Name">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="itemDesc">Description (Optional)</label>
                        <div class="controls">
                            <input type="text" id="itemDesc" data-bind="value:editObject().itemdesc" placeholder="Description...">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="itemCatagory">Catagory</label>
                        <div class="controls">
                            <input type="text" id="itemCatagory" data-bind="value:editObject().catagory" disabled >
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="itemPrice">Price</label>
                        <div class="controls">
                            <input type="text" id="itemPrice" data-bind="value:editObject().price" >
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true" data-bind="click: cancelEdit">Cancel</button>
                <button class="btn btn-primary" data-bind="click:actuallyEdit">Update</button>
            </div>
        </div>
    
    
        <div id="mailModal"  class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="mailModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="mailModalLabel">Email Us</h3>
            </div>
            <div class="modal-body">
                <p> 
                    We love getting feedback from our customers! Please email us at ... or simply use the form below. 
                </p>
                <form class="form-horizontal"> 
                    <div class="control-group">
                        
                        <div class="controls">
                           
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn btn-primary" data-bind="click:sendMail">Send</button>
            </div>
        </div>
        -->


        <form>
            <input id="baseUrl" type="hidden" value="${pageContext.request.contextPath}/" />
        </form>
    </body>
</html>
