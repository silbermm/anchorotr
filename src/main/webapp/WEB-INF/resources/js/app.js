'use strict';
angular.module('anchorotr', [
    "ui.state",
    "ui.route",
    "ui.bootstrap",
    'angular-growl',
    "anchorotr.home",
    "anchorotr.about",
    "anchorotr.location",
    "anchorotr.menus",
    "anchorotr.reservation"
]).config(function myAppConfig($locationProvider, growlProvider) {
    $locationProvider.hashPrefix('!');
    growlProvider.globalTimeToLive(5000);
}).run(function run(titleService, authService, $rootScope, $state, $stateParams) {
    $rootScope.$state = $state;
    $rootScope.$stateParams = $stateParams;
    titleService.setSuffix(' | The Anchor-OTR');
    authService.getDetails();
    $state.transitionTo("home");
}).controller('AppCtrl', function AppCtrl($scope, 
    titleService, 
    menuCollapseService, 
    authService, 
    navCollapseService, 
    $state, 
    $modal, 
    $http, 
    $log,
    growl
    ){
    titleService.setTitle("Home");
    $scope.baseUrl = document.getElementById("baseUrl").getAttribute("value");
    $scope.isCollapsed = menuCollapseService.getCollapsed();
    $scope.isNavCollapsed = navCollapseService.getCollapsed();    
    
    authService.getDetails();    
    $scope.username = authService.getUsername();       
    $scope.isAuthenticated = authService.isAuthenticated();
    $scope.isAdmin = authService.isAdmin();

    $scope.toggleMenu = function() {
        if ($state.includes('menus')) {
            menuCollapseService.setCollapsed(false);
        } else {
            menuCollapseService.setCollapsed(!menuCollapseService.getCollapsed().val);
        }
    }
    $scope.toggleNavMenu = function() {
        navCollapseService.setCollapsed(!navCollapseService.getCollapsed().val);
    }
    $scope.openMailModal = function() {
        var modalInstance = $modal.open({
            templateUrl: 'mailModal.html',
            controller: 'EmailModalInstanceCtrl',
            resolve: {
                items: function() {
                    return {
                        from: null,
                        message: null
                    }
                }
            }
        });
        modalInstance.result.then(function(mail) {
            $http.post("/mail", mail).success(function(data, status, headers, config) {
                $log.debug(data);
                $scope.openMailThanksModal();
            }).error(function(data, status, headers, config) {
                growl.addErrorMessage("There was a problem sending your message. Sorry for the inconvenience, please try again.")
            });
        });
    };
    
    $scope.openMailThanksModal = function(){
        var modalInstance = $modal.open({
            templateUrl: 'mailThanksModal.html',
            controller: 'EmailModalInstanceCtrl',   
            resolve: {
                items: function() {
                    return {
                        from: null,
                        message: null
                    }
                }
            }
        });        
        
    };
    
    
    
}).controller('EmailModalInstanceCtrl', function EmailModalInstanceController($scope, $modalInstance, items) {
    $scope.mail = items;
    $scope.ok = function() {
        $modalInstance.close($scope.mail);
    };
    $scope.cancel = function() {
        $modalInstance.dismiss('cancel');
    };
})
;





