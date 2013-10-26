'use strict';
angular.module('anchorotr.home', [
    'ui.state',
    'titleService',
    'navCollapseService',
    'menuCollapseService',
    "angulartics.google.analytics"
]).config(function config($stateProvider) {
    $stateProvider.state('home', {
        url: '/home',
        views: {
            "main": {
                controller: "HomeCtrl",
                templateUrl: 'resources/js/home/home.tpl.html'
            }
        }
    })
}).controller('HomeCtrl', function HomeController($scope, titleService, navCollapseService, menuCollapseService, $analytics) {
	  $analytics.pageTrack('/home');
    titleService.setTitle("Home");
    navCollapseService.setCollapsed(true);
    menuCollapseService.setCollapsed(true);

    $('#landing-imgs').isotope({
    	  // options
    	  itemSelector : '.item',
    	  layoutMode : 'masonry',    	  
    });
    
})
