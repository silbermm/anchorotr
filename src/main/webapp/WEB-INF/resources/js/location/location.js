'use strict';
angular.module('anchorotr.location', [
    'ui.state',
    'titleService',
]).config(function config($stateProvider) {
    $stateProvider.state('location', {
        url: '/location',
        views: {
            "main": {
                controller: "LocationCtrl",
                templateUrl: 'resources/js/location/location.tpl.html'
            }
        }
    })
}).controller('LocationCtrl', function LocationController($scope, titleService) {
    

})

