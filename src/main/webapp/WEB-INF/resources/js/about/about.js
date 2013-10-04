'use strict';
angular.module('anchorotr.about', [
    'ui.state',
    'titleService',
    'menuCollapseService',
    'navCollapseService',
]).config(function config($stateProvider) {
    $stateProvider.state('about', {
        url: '/about',
        views: {
            "main": {
                controller: "AboutCtrl",
                templateUrl: 'resources/js/about/about.tpl.html'
            }
        }
    })
}).controller('AboutCtrl', function LocationController($scope, titleService, menuCollapseService,navCollapseService) {
    titleService.setTitle("About Us");
    navCollapseService.setCollapsed(true);
    menuCollapseService.setCollapsed(true);
            
})

