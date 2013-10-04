'use strict';
angular.module('anchorotr.home', [
    'ui.state',
    'titleService',
    'navCollapseService',
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
}).controller('HomeCtrl', function HomeController($scope, titleService, navCollapseService) {
    titleService.setTitle("Home");
    navCollapseService.setCollapsed(true);
    
   
})

