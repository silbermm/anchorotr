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
                        id: null,
                        weight: 1
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
                growl.addSuccessMessage("Successfully added " + menuItem.itemName);
            }).error(function(data, status, headers, config) {
                $log.info("BOO! " + status + " " + data);
            });
        }, function() {
            $log.info('Modal dismissed at: ' + new Date());
        });
    };

    $scope.openDeleteModal = function(menuItem, idx) {
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
                        angular.forEach($scope.lunchSpecial, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.lunchSpecial);
                        break;
                    case "SPARKLING AND CHAMPAGNE":
                        angular.forEach($scope.sparklingWine, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.sparklingWine);
                        break;
                    case "ROSE":
                        angular.forEach($scope.roseWine, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.roseWine);
                        break;
                    case "RED":
                        angular.forEach($scope.redWine, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.redWine);
                        break;
                    case "WHITE":
                        angular.forEach($scope.whiteWine, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.whiteWine);
                        break;
                    case "RAW BAR":
                        angular.forEach($scope.rawBar, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.rawBar);
                        break;
                    case "PLATTERS":
                        angular.forEach($scope.platters, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.platters);
                        break;
                    case "STARTERS":
                        angular.forEach($scope.starters, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.starters);
                        break;
                    case "SALADS":
                        angular.forEach($scope.salads, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.salads);
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
                        angular.forEach($scope.sides, function(val, key) {
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");
                            if (menuItem.id === val.id) {
                                this.splice(key, 1);
                                return;
                            }
                        }, $scope.sides);
                        break;
                    case "DESERTS":
                        angular.forEach($scope.deserts, function(val,key){
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");                             
                            if(menuItem.id === val.id){                              
                               this.splice(key, 1);
                               return;
                            }
                        }, $scope.deserts);
                        break;
                    case "BEVERAGES":
                        angular.forEach($scope.beverages, function(val,key){
                            $log.debug("val = " + val + ", key = " + key);
                            $log.debug("does " + menuItem.id + " = " + val.id + "?");                             
                            if(menuItem.id === val.id){                              
                               this.splice(key, 1);
                               return;
                            }
                        }, $scope.beverages);
                        break;
                }
                growl.addSuccessMessage("Successfully deleted " + menuItem.itemName);
            }).error(function(data, status, headers, config) {
                growl.addErrorMessage("Something went wrong trying to delete " + menuItem.itemName);
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
                        angular.forEach($scope.lunchSpecial, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.lunchSpecial);
                        break;
                    case "SPARKLING AND CHAMPAGNE":
                        angular.forEach($scope.sparklingWine, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.sparklingWine);
                        break;
                    case "ROSE":
                        angular.forEach($scope.roseWine, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.roseWine);
                        break;
                    case "RED":
                        angular.forEach($scope.redWine, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.redWine);
                        break;
                    case "WHITE":
                        angular.forEach($scope.whiteWine, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.whiteWine);
                        break;
                    case "RAW BAR":
                        angular.forEach($scope.rawBar, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.rawBar);
                        break;
                    case "PLATTERS":
                        angular.forEach($scope.platters, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.platters);
                        break;
                    case "STARTERS":
                        angular.forEach($scope.starters, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.starters);
                        break;
                    case "SALADS":
                        angular.forEach($scope.salads, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.salads);
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
                        angular.forEach($scope.sides, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.sides);
                        break;
                    case "DESERTS":
                        angular.forEach($scope.deserts, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.deserts);
                        break;
                    case "BEVERAGES":
                        angular.forEach($scope.beverages, function(val, key) {
                            if (val.id === menuItem.id) {
                                this[key] = menuItem;
                                return;
                            }
                        }, $scope.beverages);
                        break;
                }
                growl.addSuccessMessage("Successfully updated " + menuItem.itemName);
            }).error(function(data, status, headers, config) {
                growl.addErrorMessage("Unable to update " + menuItem.itemName);
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

