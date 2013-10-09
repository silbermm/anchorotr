'use strict';
angular.module('anchorotr.menus', [
    'ui.state',
    'titleService',
    'menuCollapseService',
    'authService',
    'angular-growl',
    'ui.bootstrap',
    'navCollapseService',
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
}).controller('ModalInstanceCtrl', function ModalInstanceController($scope, $modalInstance, items) {
    $scope.menuItem = items;
    $scope.ok = function() {
        $modalInstance.close($scope.menuItem);
    };
    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
}).controller('MenuCtrl', function MenuController($scope, titleService, menuCollapseService, navCollapseService, authService, $stateParams, $modal, $http, $log, growl) {
    navCollapseService.setCollapsed(true);
    menuCollapseService.setCollapsed(false);
    authService.getDetails();
    
    growl.addWarnMessage("This adds a warn message");
    
    $scope.username = authService.getUsername();
    $scope.isAuthenticated = authService.isAuthenticated();
    $scope.isAdmin = authService.isAdmin();
    
    $scope.openAddModal = function(currentCatagory) {
        var modalInstance = $modal.open({
            templateUrl: 'addModal.html',
            controller: 'ModalInstanceCtrl',
            resolve: {
                items: function() {
                    return {
                        menu: $scope.currentMenu,
                        catagory: currentCatagory,
                        price: null,
                        itemName: null,
                        itemDesc: null,
                        id: null
                    }
                }
            }
        });
        modalInstance.result.then(function(menuItem) {
            $log.info(menuItem);
            // Create the Menu Item and add it to the correct menu
            $http.post('/menus/items', menuItem).success(function(data, status, headers, config) {
                menuItem['id'] = data.added;
                switch (menuItem.catagory) {
                    case "LUNCH SPECIAL":
                        $scope.lunchSpecial.push(menuItem);
                        break;
                    case "SPARKLING AND CHAMPAGNE":
                        $scope.sparklingWine.push(menuItem);
                        break;
                    case "ROSE":
                        $scope.roseWine.push(menuItem);
                        break;
                    case "RED":
                        $scope.redWine.push(menuItem);
                        break;
                    case "WHITE":
                        $scope.whiteWine.push(menuItem);
                        break;
                    case "RAW BAR":
                        $scope.rawBar.push(menuItem);
                        break;
                    case "PLATTERS":
                        $scope.platters.push(menuItem);
                        break;
                    case "STARTERS":
                        $scope.starters.push(menuItem);
                        break;
                    case "SALADS":
                        $scope.salads.push(menuItem);
                        break;
                    case "COCKTAILS":
                        $scope.cocktailsCol2.push(menuItem);
                        break;
                    case "MAINS":
                        $scope.mainsCol2.push(menuItem);
                        break;
                    case "SIDES":
                        $scope.sides.push(menuItem);
                        break;
                    case "DESERTS":
                        $scope.deserts.push(menuItem);
                        break;
                    case "BEVERAGES":
                        $scope.beverages.push(menuItem);
                        break;
                }
            }).error(function(data, status, headers, config) {
                $log.info("BOO! " + status + " " + data);
            });
        }, function() {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };

    $scope.openDeleteModal = function(menuItem, idx) {
        $scope.deleteIdx = idx;
        var modalInstance = $modal.open({
            templateUrl: 'deleteModal.html',
            controller: 'ModalInstanceCtrl',
            resolve: {
                items: function() {
                    return menuItem;
                }
            }
        });
        modalInstance.result.then(function(menuItem) {
            $log.info(menuItem);
            $http.delete("/menus/items/" + menuItem.id).success(function(data, status, headers, config) {
                $log.info("removed item with id: " + data.removed);
                switch (menuItem.catagory) {
                    case "LUNCH SPECIAL":
                        $scope.lunchSpecial.splice($scope.deleteIdx, 1);
                        break;
                    case "SPARKLING AND CHAMPAGNE":
                        $scope.sparklingWine.splice($scope.deleteIdx, 1);
                        break;
                    case "ROSE":
                        $scope.roseWine.splice($scope.deleteIdx, 1);
                        break;
                    case "RED":
                        $scope.redWine.splice($scope.deleteIdx, 1);
                        break;
                    case "WHITE":
                        $scope.whiteWine.splice($scope.deleteIdx, 1);
                        break;
                    case "RAW BAR":
                        $scope.rawBar.splice($scope.deleteIdx, 1);
                        break;
                    case "PLATTERS":
                        $scope.platters.splice($scope.deleteIdx, 1);
                        break;
                    case "STARTERS":
                        $scope.starters.splice($scope.deleteIdx, 1);
                        break;
                    case "SALADS":
                        $scope.salads.splice($scope.deleteIdx, 1);
                        break;
                    case "COCKTAILS":
                        angular.forEach($scope.cocktailsCol1, function(val, key) {
                            if (val.id === menuItem.id) {
                                this.splice(key, 1);
                            }
                        }, $scope.cocktailCol1);
                        angular.forEach($scope.cocktailsCol2, function(val, key) {
                            if (val.id === menuItem.id) {
                                this.splice(key, 1);
                            }
                        }, $scope.cocktailCol2);
                        break;
                    case "MAINS":
                        angular.forEach($scope.mainsCol1, function(val, key) {
                            if (val.id === menuItem.id) {
                                this.splice(key, 1);
                            }
                        }, $scope.mainsCol1);
                        angular.forEach($scope.mainsCol2, function(val, key) {
                            if (val.id === menuItem.id) {
                                this.splice(key, 1);
                            }
                        }, $scope.mainsCol2);
                        break;
                    case "SIDES":
                        $scope.sides.splice($scope.deleteIdx, 1);
                        break;
                    case "DESERTS":
                        $scope.deserts.splice($scope.deleteIdx, 1);
                        break;
                    case "BEVERAGES":
                        $scope.beverages.splice($scope.deleteIdx, 1);
                        break;
                }
            }).error(function(data, status, headers, config) {
                $log.info("failed to remove: " + data.error);
            });
        }, function() {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };

    $scope.openEditModal = function(menuItem, idx) {
        $scope.editIdx = idx;
        var modalInstance = $modal.open({
            templateUrl: 'editModal.html',
            controller: 'ModalInstanceCtrl',
            resolve: {
                items: function() {
                    return menuItem;
                }
            }
        });
        modalInstance.result.then(function(menuItem) {
            $log.info(menuItem);
            $http.put("/menus/items", menuItem).success(function(data, status, headers, config) {
                $log.info("updated item with id: " + data.updated);
                switch (menuItem.catagory) {
                    case "LUNCH SPECIAL":
                        $scope.lunchSpecial[$scope.editIdx] = menuItem;
                        break;
                    case "SPARKLING AND CHAMPAGNE":
                        $scope.sparklingWine[$scope.editIdx] = menuItem;
                        break;
                    case "ROSE":
                        $scope.roseWine[$scope.editIdx] = menuItem;
                        break;
                    case "RED":
                        $scope.redWine[$scope.editIdx] = menuItem;
                        break;
                    case "WHITE":
                        $scope.whiteWine[$scope.editIdx] = menuItem;
                        break;
                    case "RAW BAR":
                        $scope.rawBar[$scope.editIdx] = menuItem;
                        break;
                    case "PLATTERS":
                        $scope.platters[$scope.editIdx] = menuItem;
                        break;
                    case "STARTERS":
                        $scope.starters[$scope.editIdx] = menuItem;
                        break;
                    case "SALADS":
                        $scope.salads[$scope.editIdx] = menuItem;
                        break;
                    case "COCKTAILS":
                        angular.forEach($scope.cocktailsCol1, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                            }
                        }, $scope.cocktailCol1);
                        angular.forEach($scope.cocktailsCol2, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                            }
                        }, $scope.cocktailCol2);
                        break;
                    case "MAINS":
                        angular.forEach($scope.mainsCol1, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                            }
                        }, $scope.mainsCol1);
                        angular.forEach($scope.mainsCol2, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                            }
                        }, $scope.mainsCol2);
                        break;
                    case "SIDES":
                        $scope.sides[$scope.editIdx] = menuItem;
                        break;
                    case "DESERTS":
                        $scope.deserts[$scope.editIdx] = menuItem;
                        break;
                    case "BEVERAGES":
                        $scope.beverages[$scope.editIdx] = menuItem;
                        break;
                }
            }).error(function(data, status, headers, config) {
                $log.info("failed to remove: " + data.error);
            });
        }, function() {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };




    if ($stateParams.id === 'lunch') {
        titleService.setTitle("Lunch Menu");
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
            for (var i = 0; i < data.length; i++) {
                if (i + 1 <= firstColumn) {
                    $scope.mainsCol1.push(data[i]);
                } else {
                    $scope.mainsCol2.push(data[i]);
                }
            }
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        })
        $scope.showWarning = true;
    }

    if ($stateParams.id === 'dinner') {
        $scope.currentMenu = 2;
        titleService.setTitle("Dinner Menu");
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
            for (var i = 0; i < data.length; i++) {
                if (i + 1 <= firstColumn) {
                    $scope.mainsCol1.push(data[i]);
                } else {
                    $scope.mainsCol2.push(data[i]);
                }
            }
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        })
        $scope.showWarning = true;
    }

    if ($stateParams.id == 'wine') {
        $scope.currentMenu = 3;
        titleService.setTitle("Wine Menu");
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

    if ($stateParams.id == 'cocktails') {
        $scope.currentMenu = 4;
        titleService.setTitle("House Cocktails");
        $http.get('/menus/4').success(function(data, status, headers, config) {
            $scope.cocktailsCol1 = new Array();
            $scope.cocktailsCol2 = new Array();
            var half = data.length / 2;
            var leftover = data.length % 2;
            var firstColumn = half + leftover;
            for (var i = 0; i < data.length; i++) {
                if (i + 1 <= firstColumn) {
                    $scope.cocktailsCol1.push(data[i]);
                } else {
                    $scope.cocktailsCol2.push(data[i]);
                }
            }
        }).error(function(data, status, headers, config) {
            console.log(status + " " + data);
        });
    }

    if ($stateParams.id == 'happyHour') {
        titleService.setTitle("Happy Hour");
        $scope.happyHour = true;
    }

});

