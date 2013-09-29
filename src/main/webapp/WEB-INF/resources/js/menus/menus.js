'use strict';
angular.module('anchorotr.menus', [
    'ui.state',
    'titleService',
]).config(function config($stateProvider, $urlRouterProvider) {
    $stateProvider.state('menus', {
        abstract: true,
        url: '/menus/:name',
        views: {
            "main": {
                controller: "MenuCtrl",
                templateUrl: 'resources/js/menus/menus.tpl.html'
            }
        }
    })
}).controller('MenuCtrl', function MenuController($scope, titleService, $http) {
    
    

})

