<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html id="topHtml">
    <head>     
        <title data-bind="text: $root.pageTitle">The Anchor-OTR</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='http://fonts.googleapis.com/css?family=Quicksand' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Glass+Antiqua&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link type="text/css" rel="stylesheet" href="http://fast.fonts.com/cssapi/32e3358a-7cdb-4ede-bd45-eb874aa3d12e.css">
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" media="screen" href="/resources/css/responsive.css" >
        <link rel="shortcut icon" href="/resources/img/favicon.ico" > 
        <script data-main="/resources/js/main" src="/resources/js/lib/require.js"></script>
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
                                    <li data-bind="css:{active: currentMenuLink()=='lunch'}">
                                        <a href="#/menus/lunch"> Lunch Menu </a>
                                    </li>
                                    <li data-bind="css:{active: currentMenuLink()=='dinner'}"> 
                                        <a href="#/menus/dinner"> Dinner Menu </a>
                                    </li>
                                    <li data-bind="css:{active: currentMenuLink()=='wine'}">
                                        <a href="#/menus/wine"> Wine List </a>
                                    </li>
                                    <li data-bind="css:{active: currentMenuLink()=='cocktails'}">
                                        <a href="#/menus/cocktails"> House Cocktails </a>
                                    </li>
                                    <li data-bind="css:{active: currentMenuLink()=='happyHour'}">
                                        <a href="#/menus/happyHour"> Happy Hour </a>
                                    </li>
                                    <li data-bind="css: {active: currentView()=='locationTemplate'}">
                                        <a href="#/location"> Location </a>
                                    </li>
                                    <li data-bind="css: {active: currentView()=='aboutTemplate'}">
                                        <a href="#/about">About </a>
                                    </li>
                                    <li>
                                        <a href="http://www.opentable.com/the-anchor-reservations-cincinnati?restref=100687" target="_blank"> Reservations </a>
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
                <div data-bind='template : {name : currentView, data: currentModel}' > </div>
                <!-- 
                <div data-bind="visible:currentView()=='reserveTemplate'">
                    <div class="row-fluid ui-view" id="inline-reserve-template">
                        <div class="container">
                            <div id="OT_center">
                                <script type="text/javascript" src="http://www.opentable.com/frontdoor/default.aspx?rid=100687&restref=100687&bgcolor=F6F6F3&titlecolor=0F0F0F&subtitlecolor=0F0F0F&btnbgimage=http://www.opentable.com/frontdoor/img/ot_btn_red.png&otlink=FFFFFF&icon=dark&mode=short&hover=1"></script><a href="http://www.opentable.com/the-anchor-reservations-cincinnati?rtype=ism&restref=100687" class="OT_ExtLink">The Anchor (100687), Cincinnati / Dayton Reservations</a>
                            </div>
                        </div>
                    </div>
                </div>
                -->
                <div data-bind='template: {name : "footer"}'></div>
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
                                <li data-bind="css: {active: isMenuView}"> 
                                    <a href="" data-bind="click:showSubMenu">Menus</a>
                                </li>
                                <li data-bind="css: {active: currentView()=='locationTemplate'}">
                                    <a href="#/location"> Location </a>
                                </li>
                            </ul>
                        </div>
                        <div class="span4"> </div>	
                        <div class="span4">
                            <ul class="inline text-left">
                                <li data-bind="css: {active: currentView()=='aboutTemplate'}">
                                    <a href="#/about"> About </a>
                                </li>
                                <li data-bind="css: {active: currentView()=='reserveTemplate'}">
                                    <a href="#/reserve"> Reservations </a> 
                                    <!-- <a href="http://www.opentable.com/the-anchor-reservations-cincinnati?restref=100687" target="_blank"> Reservations </a> -->
                                </li>
                            </ul>	
                        </div>
                    </div>
                </div>	
                <div id="submenu" class="row-fluid collapse">
                    <div class="container">	
                        <ul class="inline">
                            <li data-bind="css:{active: currentMenuLink()=='lunch'}">
                                <a href="#/menus/lunch"> Lunch </a>	
                            </li>
                            <li data-bind="css:{active: currentMenuLink()=='dinner'}">
                                <a href="#/menus/dinner"> Dinner </a>
                            </li>	
                            <li data-bind="css:{active: currentMenuLink()=='wine'}">
                                <a href="#/menus/wine" > Wine List </a>
                            </li>
                            <li data-bind="css:{active: currentMenuLink()=='cocktails'}">
                                <a href="#/menus/cocktails"> House Cocktails </a>
                            </li>
                            <li data-bind="css:{active: currentMenuLink()=='happyHour'}">
                                <a href="#/menus/happyHour"> Happy Hour </a>
                            </li>
                        </ul>	
                    </div>
                </div>	
                <div class="container" id="menu-border"></div>	

                <div data-bind='template : {name : currentView, 
                     data: currentModel,
                     beforeRemove: hideElement,
                     afterAdd: showElement}' > 
                </div>  
                
                <div data-bind="visible:currentView()=='reserveTemplate'">
                    <div class="row-fluid ui-view" id="inline-reserve-template">
                        <div class="container">
                            <div id="OT_center">
                                <script type="text/javascript" src="http://www.opentable.com/frontdoor/default.aspx?rid=100687&restref=100687&bgcolor=F6F6F3&titlecolor=0F0F0F&subtitlecolor=0F0F0F&btnbgimage=http://www.opentable.com/frontdoor/img/ot_btn_red.png&otlink=FFFFFF&icon=dark&mode=short&hover=1"></script><a href="http://www.opentable.com/the-anchor-reservations-cincinnati?rtype=ism&restref=100687" class="OT_ExtLink">The Anchor (100687), Cincinnati / Dayton Reservations</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div data-bind='template: {name : "footer"}'></div>   
            </div>	
        </div>



        <script type="text/html" id="homeTemplate">                       
            <div class="row-fluid ui-view" id="landing-imgs">
            <img src="${pageContext.request.contextPath}/resources/img/landing.jpg" />
            </div>
        </script>



        <script type="text/html" id="locationTemplate">
            <div class="row-fluid ui-view" id="location-page">
            <div class="container">
            <ul class="inline text-center">
            <li>
            <a class="thumbnail">
            <img src="${pageContext.request.contextPath}/resources/img/location1.jpg">
            </a>
            </li>
            <li>
            <a class="thumbnail">
            <img src="${pageContext.request.contextPath}/resources/img/location2.jpg">
            </a>
            </li>
            </ul>
            <div class="map"> 
            <a href="https://www.google.com/maps/preview#!q=Anchor+OTR%2C+Cincinnati%2C+OH%2C+North+America&data=!4m10!1m9!4m8!1m3!1d120951!2d-84.5404014!3d39.1363401!3m2!1i816!2i938!4f13.1" target="_blank" >
            <img src="https://maps.googleapis.com/maps/api/staticmap?size=400x200&scale=2&markers=color:red%7CAnchor+OTR,Cincinnati,+OH,+North+America&sensor=true" />
            </a>
            <br />
            <br />
            <br />
            <p clas="text-center">
            Looking for parking? 
            <a style="font-size:12px;color:black" href="http://washingtonpark.org/parking/" target="_blank"> http://washingtonpark.org/parking/ </a>
            </p>
            </div>
            </div>

            </div>		
        </script>

        <script type="text/html" id="reserveTemplate">
            <h2> OPen Table </h2>
            <div id="OT_searchWrapperAll">
            
            </div>
        </script>

        <script type="text/html" id="aboutTemplate">
            <div class="row-fluid ui-view" id="about-page">
            <div class="container">	
            <div class="about-photos">
            <ul class="inline text-center">
            <li>
            <a class="thumbnail">
            <img src="${pageContext.request.contextPath}/resources/img/about1.jpg">
            </a>
            </li>
            <li>
            <a class="thumbnail">
            <img src="${pageContext.request.contextPath}/resources/img/about2.jpg">
            </a>
            </li>
            <li>
            <a class="thumbnail">
            <img src="${pageContext.request.contextPath}/resources/img/about3.jpg">
            </a>
            </li>
            </ul>	
            <br/>
            <p class="callout"> 
            The Anchor-otr brings a classic seafood experience to land locked Cincinnatians. From Maine sea scallops to grilled whole fish
            to fresh oysters flown in from the west and east coast,  chef/owner Derek dos Anjos's team serves high quality and sustainable seafood
            from the countries best suppliers.  Beach food classics such as  hush puppies and lobster rolls will transport you to your favorite spot along
            the coast. With a wine list chosen to compliment seafood, craft cocktails and a warm sense of hospitality, The Anchor-otr brings laid back
            extravagance to Washington Park in Over the Rhine.  The dining rooms custom charred wood walls, communal table seating and nautical lighting
            encourage a playful experience.		
            </p>

            <div class="food-menu-container">
            <div class="food-menu-title">THE TEAM </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>					
            <table class="table table-condensed">
            <tbody>	
            <tr>
            <td class="team-name"> Derek dos Anjos </td>
            <td class="team-name"> Jocelyn dos Anjos </td>	
            <td class="team-name"> Steven Campbell </td>
            <td class="team-name"> Aaron Drahmann </td>	
            </tr>
            <tr>
            <td class="team-title"> Chef/ Owner </td>
            <td class="team-title"> Owner/ Operations </td>
            <td class="team-title"> General Manager </td>
            <td class="team-title"> Sous Chef </td>
            </tr>
            </tbody>
            </table>
            </div>
            </div>

            </div>
            </div>
        </script>



        <script type="text/html" id="foodMenuTemplate">
            <div class="row-fluid ui-view" id="lunch-page" data-bind="with: $root.menuViewModel">
            <div class="container">

            <div class="row-fluid" data-bind="if:happyHour()">
            <div class="span12">
            <h3> COMING SOON! </h3>
            </div>
            </div>

            <!-- WINE LIST -->
            <div class="row-fluid" data-bind="if:sparklingWine().length >0">

            <!-- Sparkling and Champagne -->
            <div class="span6 food-menu-container" data-bind="fadeVisible:showSparklingRow" >
            <div class="food-menu-title"> Champagne 
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('SPARKLING AND CHAMPAGNE'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>	
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:sparklingWine" class="food-item-tbl">
            <tr> 
            <td><span data-bind="text:itemdesc"></span></td>
            <td><span data-bind="text:itemname"><span data-bind="text: $index"></span></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr> <td colspan="3" style="border-top:none"> </td> </tr>
            </tbody>
            </table>
            </div>

            <!-- ROSE -->
            <div class="span6"  data-bind="fadeVisible:roseWine().length>0" >
            <div class="food-menu-title"> ROSÉ 
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('ROSE'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize></div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>	
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:roseWine" class="food-item-tbl">
            <tr> 
            <td><span data-bind="text:itemdesc"></span></td>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr> <td colspan="3" style="border-top:none"> </td> </tr>
            </tbody>
            </table>
            </div>
            </div>

            <div class="row-fluid" data-bind="fadeVisible:redWine().length >0"> 
            <div class="span6 food-menu-container" data-bind="if:redWine().length >0">
            <div class="food-menu-title"> RED 
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('RED'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize></div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>	
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:redWine" class="food-item-tbl">
            <tr> 
            <td><span data-bind="text:itemdesc"></span></td>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr> <td colspan="3" style="border-top:none"> </td> </tr>
            </tbody>
            </table>
            </div>
            <div class="span6" data-bind="fadeVisible:whiteWine().length>0" >
            <div class="food-menu-title"> WHITE 
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('WHITE'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize></div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>	
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:whiteWine" class="food-item-tbl">
            <tr> 
            <td><span data-bind="text:itemdesc"></span></td>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr> <td colspan="3" style="border-top:none"> </td> </tr>
            </tbody>
            </table>
            </div>
            </div>


            <div class="row-fluid" data-bind="fadeVisible:lunchSpecial().length>0">          
            <!-- LUNCH SPECIAL -->
            <div class="span12">
            <div class="food-menu-container food-menu-container-border middle-callout"> 
            <div class="food-menu-title">LUNCH SPECIAL
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('LUNCH SPECIAL'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>
            <ul class="food-menu-list" data-bind="foreach:lunchSpecial">
            <li>
            <div class="food-item-first-line">
            <div class="food-item-title" data-bind="text:itemname"></div>
            </div>
            <div class="food-item-second-line" data-bind="if:itemdesc,text:itemdesc"></div>
            <div class="food-item-price">
            <span data-bind="text:price"> </span>
            <security:authorize access="hasRole('Administrator')"> 
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
            </security:authorize>
            </div>
            </li>
            </ul>
            </div>
            </div>	
            </div>			

            <div class="row-fluid" data-bind="fadeVisible:rawBar().length>0">
            <div class="span6 food-menu-container" data-bind="fadeVisible:rawBar().length>0">
            <div class="food-menu-title"> RAW BAR 
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('RAW BAR'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>	
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:rawBar" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            <!--        
            <ul class="food-menu-list" data-bind="foreach:rawBar">
            <li>
            <div class="food-item-first-line">
            <div class="food-item-title" data-bind="text:itemname"></div>
            <div class="food-item-line" > </div>	
            <div class="food-item-price" data-bind="text:price"></div>
            </div>
            </li>	
            </ul>
            -->
            </div>
            <div class="span6 food-menu-container" data-bind="fadeVisible:platters().length>0">
            <div class="food-menu-title"> PLATTERS
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('PLATTERS'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div> 
            <table class="table table-condensed">
            <tbody data-bind="foreach:platters" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            <!--
            <ul class="food-menu-list" data-bind="foreach:platters">
            <li>
            <div class="food-item-first-line">
            <div class="food-item-title" data-bind="text:itemname"></div>
            <div class="food-item-line" > </div>	
            <div class="food-item-price" data-bind="text:price"></div>
            <div class="food-item-second-line" data-bind="if:itemdesc,text:itemdesc"></div>
            </div>
            </li>	
            </ul>
            -->
            </div>		
            </div>


            <div class="row-fluid" data-bind="fadeVisible:starters().length>0">
            <!-- STARTERS -->
            <div class="span6 food-container" data-bind="fadeVisible:starters().length>0">
            <div class="food-menu-title"> STARTERS 
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('STARTERS'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:starters" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div>	

            <!-- SALADS -->
            <div class="span6 food-container" data-bind="fadeVisible:salads().length>0">
            <div class="food-menu-title"> SALADS
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('SALADS'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:salads" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div>
            </div>


            <!-- COCKTAILS -->
            <div class="row-fluid" data-bind="fadeVisible:cocktailsCol1().length>0">
            <div class="span12 food-container" data-bind="fadeVisible:cocktailsCol1().length>0">
            <div class="food-menu-title"> House Cocktails
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('COCKTAILS'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>
            <div class="fmc-double-column">
            <table class="table table-condensed">
            <tbody data-bind="foreach:cocktailsCol1" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div>
            <div class="fmc-double-column fmcdc-last">
            <table class="table table-condensed">
            <tbody data-bind="foreach:cocktailsCol2" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div> 
            </div>
            </div>


            <!-- MAINS -->
            <div class="row-fluid" data-bind="fadeVisible:mainsCol1().length>0">
            <div class="span12 food-container" >
            <div class="food-menu-title"> MAINS
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('MAINS'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>
            <div class="fmc-double-column">
            <table class="table table-condensed">
            <tbody data-bind="foreach:mainsCol1" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div>
            <div class="fmc-double-column fmcdc-last">
            <table class="table table-condensed">
            <tbody data-bind="foreach:mainsCol2" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div>
            </div>	
            </div>

            <div class="row-fluid" data-bind="fadeVisible:sides().length>0">	
            <!-- SIDES -->
            <div class="span6 food-container" data-bind="fadeVisible:sides().length>0">
            <div class="food-menu-title"> SIDES
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('SIDES'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:sides" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div>

            <!-- DESERTS -->
            <div class="span6 food-container" data-bind="fadeVisible:deserts().length>0">
            <div class="food-menu-title"> DESERTS
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('DESERTS'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:deserts" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div>
            </div>

            <div class="row-fluid">
            <!-- BEVERAGES -->
            <div class="span6 food-container" data-bind="fadeVisible:beverages().length>0">
            <div class="food-menu-title">BEVERAGES
            <security:authorize access="hasRole('Administrator')">
                <a class="pointer" data-bind="click:function () { addItem('BEVERAGES'); }"> <i class="icon-plus-sign"></i></a>
            </security:authorize>
            </div>
            <div class="food-menu-title-ornament-container">
            <div class="food-menu-title-ornament"></div>
            </div>
            <table class="table table-condensed">
            <tbody data-bind="foreach:beverages" class="food-item-tbl">
            <tr>
            <td><span data-bind="text:itemname"></span></td>
            <td class="pull-right"><span data-bind="text:price"> </span></td>
            <security:authorize access="hasRole('Administrator')"> 
                <td>
                <span>
                <a data-bind="click:$parent.editItem" class="pointer"> <i class="icon-edit-sign"></i> </a> 
                <a data-bind="click:$parent.deleteItem" class="pointer"> <i class="icon-remove-sign red"></i></a>
                </span>
                </td>
            </security:authorize>
            </tr>
            <tr>
            <td colspan="2" style="border-top:none"><span class="food-item-tbl-desc" data-bind="text:itemdesc"></span></td>
            </tr>
            </tbody>
            </table>
            </div>	
            </div>		
            </div>

            <div class="row-fluid" data-bind="fadeVisible:showWarning">
            <div class="aside-container">
            <div class="food-menu-container food-menu-container-border aside" style="opacity:1;">
            <img class="food-menu-container-image" src="${pageContext.request.contextPath}/resources/img/shark-small.gif" style="opacity: 1;">
            <div class="aside-text">There is a risk associated with consumption of raw oysters or any raw protein</div>
            </div>
            </div>
            </div>
        </script>

        <script type="text/html" id="footer">
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

            <a data-bind="click: showMailModal"> 
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
        </script>

        <!-- Modal -->
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
                        <!-- label -->
                        <div class="controls">
                            <!-- input -->
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                <button class="btn btn-primary" data-bind="click:sendMail">Send</button>
            </div>
        </div>



        <form>
            <input id="baseUrl" type="hidden" value="${pageContext.request.contextPath}/" />
        </form>
    </body>
</html>
