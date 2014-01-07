'use strict';
angular.module('anchorotr.location', [
    'ui.router.state',
    'titleService',
    'menuCollapseService',
    'navCollapseService',
]).config(function config($stateProvider) {
    $stateProvider.state('location', {
        url: '/location',
        views: {
            "main": {
                controller: "LocationCtrl",
                templateUrl: 'location/location.tpl.html'
            }
        }
    })
}).controller('LocationCtrl', function LocationController($scope, titleService, menuCollapseService, navCollapseService) {
    titleService.setTitle("Location");
    navCollapseService.setCollapsed(true);
    $scope.isCollapsed = menuCollapseService.setCollapsed(true);

})

