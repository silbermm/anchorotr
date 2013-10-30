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
}).controller('HomeCtrl', function HomeController($scope, titleService, navCollapseService, menuCollapseService, $log, $http) {	
    titleService.setTitle("Home");
    navCollapseService.setCollapsed(true);
    menuCollapseService.setCollapsed(true);
	
    $scope.images = new Array();
    
    $http.get("/landing/imgs").success(function(data,status,config,other){
    	for(var i = 0; i< data.length; i++){
    		$scope.images.push(data[i]);
    	}
    }).error(function(data,status,config,other){
    	$log.error(data);
    });   
    
})
