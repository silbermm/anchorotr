'use strict';
angular.module('anchorotr.menus', [
    'ui.state',
    'titleService',
]).config(function config($stateProvider, $urlRouterProvider) {
    $stateProvider.state('menus', {
        url: '/menus/:id',
        views: {
            "main": {
                controller: "MenuCtrl",
                templateUrl: 'resources/js/menus/menus.tpl.html'
            }
        }
    })
}).controller('MenuCtrl', function MenuController($scope, titleService, $stateParams, $state, $http) {

    /*
    $scope.rawBar = {};
    $scope.platters = {};
    $scope.starters = {};
    $scope.salads = {};
    $scope.sides = {};
    $scope.deserts = {};
    $scope.lunchSpecial = null;
    $scope.beverages = null;
    $scope.happyHour = null;
    $scope.cocktailsCol1 = {};
    $scope.cocktailsCol2 = {};
    $scope.mainsCol1 = {};
    $scope.mainsCol2 = {};
    $scope.sparklingWine = {};
    $scope.whiteWine = {};
    $scope.redWine = {};
    $scope.roseWine = {};
    */
   
    var getMenu = function(menuId, catagory, observable) {
        var d = $http.get('/menus/' + menuId + "/" + catagory).success(function(data, status, headers, config) {
            return data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        return d;
    }

    if ($stateParams.id == 'lunch') {
        console.log("in the rawbar method");
        $scope.currentMenu = 1;
        $http.get('/menus/1/RAW%20BAR').success(function(data, status, headers, config) {
            $scope.rawBar = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
    
        $http.get('/menus/1/PLATTERS').success(function(data, status, headers, config) {
            $scope.platters = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
    
        $http.get('/menus/1/STARTERS').success(function(data, status, headers, config) {
            $scope.starters = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/1/SALADS').success(function(data, status, headers, config) {
            $scope.salads = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/1/SIDES').success(function(data, status, headers, config) {
            $scope.sides = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/1/DESERTS').success(function(data, status, headers, config) {
            $scope.deserts = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/1/BEVERAGES').success(function(data, status, headers, config) {
            $scope.beverages = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/1/LUNCH%20SPECIAL').success(function(data, status, headers, config) {
            $scope.lunchSpecial = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
    }





})

