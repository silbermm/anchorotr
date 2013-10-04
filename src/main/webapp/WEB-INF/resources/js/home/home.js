'use strict';
angular.module('anchorotr.home', [
    'ui.state',
    'titleService',
    'navCollapseService',
		'menuCollapseService',
]).config(function config($stateProvider) {
    $stateProvider.state('home', {
        url: '/home',
        views: {
            "main": {
                controller: "HomeCtrl",
                templateUrl: 'resources/js/home/home.tpl.html'
            },
            "footer": {
                controller: "AppCtrl",
                templateUrl: 'resources/js/global/footer.tpl.html'
            }
        }
    })
}).controller('HomeCtrl', function HomeController($scope, titleService, navCollapseService,menuCollapseService) {
    titleService.setTitle("Home");
    navCollapseService.setCollapsed(true);
		menuCollapseService.setCollapsed(true);
    
   
})

