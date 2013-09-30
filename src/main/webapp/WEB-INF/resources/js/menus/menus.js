'use strict';
angular.module('anchorotr.menus', [
    'ui.state',
    'titleService',
    'menuCollapseService',
    'authService'
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
}).controller('MenuCtrl', function MenuController($scope, titleService, menuCollapseService, authService, $stateParams, $state, $http) {
    
    menuCollapseService.setCollapsed(false);
    
    authService.getDetails();

    $scope.username = authService.getUsername();
    $scope.isAuthenticated = authService.isAuthenticated();
    $scope.isAdmin = authService.isAdmin();



    if ($stateParams.id === 'lunch') {
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

        $http.get('/menus/1/MAINS').success(function(data, status, headers, config) {
            $scope.mainsCol1 = new Array();
            $scope.mainsCol2 = new Array();
            var half = data.length / 2;
            var leftover = data.length % 2;
            var firstColumn = half + leftover;
            for(var i=0; i<data.length; i++){
                if (i+1 <= firstColumn){
                    console.log("adding " + data[i].itemName + " to col1");
                    $scope.mainsCol1.push(data[i]);
                } else {
                    console.log("adding " + data[i].itemName +" to col2");
                    $scope.mainsCol2.push(data[i]);
                }
            }            
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        })
        $scope.showWarning = true;
    }

    if ($stateParams.id === 'dinner') {
        $http.get('/menus/2/RAW%20BAR').success(function(data, status, headers, config) {
            $scope.rawBar = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });

        $http.get('/menus/2/PLATTERS').success(function(data, status, headers, config) {
            $scope.platters = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });

        $http.get('/menus/2/STARTERS').success(function(data, status, headers, config) {
            $scope.starters = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });

        $http.get('/menus/2/SALADS').success(function(data, status, headers, config) {
            $scope.salads = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });

        $http.get('/menus/2/SIDES').success(function(data, status, headers, config) {
            $scope.sides = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });

        $http.get('/menus/2/DESERTS').success(function(data, status, headers, config) {
            $scope.deserts = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/2/MAINS').success(function(data, status, headers, config) {
            $scope.mainsCol1 = new Array();
            $scope.mainsCol2 = new Array();
            var half = data.length / 2;
            var leftover = data.length % 2;
            var firstColumn = half + leftover;
            for(var i=0; i<data.length; i++){
                if (i+1 <= firstColumn){
                    console.log("adding " + data[i].itemName + " to col1");
                    $scope.mainsCol1.push(data[i]);
                } else {
                    console.log("adding " + data[i].itemName +" to col2");
                    $scope.mainsCol2.push(data[i]);
                }
            }            
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        })
        $scope.showWarning = true;
    }

    if ($stateParams.id == 'wine'){
        $http.get('/menus/3/WHITE').success(function(data, status, headers, config) {
            $scope.whiteWine = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/3/ROSE').success(function(data, status, headers, config) {
            $scope.roseWine = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/3/RED').success(function(data, status, headers, config) {
            $scope.redWine = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
        
        $http.get('/menus/3/SPARKLING%20AND%20CHAMPAGNE').success(function(data, status, headers, config) {
            $scope.sparklingWine = data;
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
    }
    
    if ($stateParams.id == 'cocktails'){
        $http.get('/menus/4').success(function(data, status, headers, config) {
            $scope.cocktailsCol1 = new Array();
            $scope.cocktailsCol2 = new Array();
            var half = data.length / 2;
            var leftover = data.length % 2;
            var firstColumn = half + leftover;
            for(var i=0; i<data.length; i++){
                if (i+1 <= firstColumn){
                    console.log("adding " + data[i].itemName + " to col1");
                    $scope.cocktailsCol1.push(data[i]);
                } else {
                    console.log("adding " + data[i].itemName +" to col2");
                    $scope.cocktailsCol2.push(data[i]);
                }
            }   
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
    }
    
    if ($stateParams.id == 'happyHour'){
        $scope.happyHour = true;
    }

})

