'use strict';
angular.module('anchorotr', [
    "ui.state",
    "ui.route",
    "ui.bootstrap",
    "anchorotr.home",
    "anchorotr.about",
    "anchorotr.location",
    "anchorotr.menus",
    "anchorotr.reservation"
])
        .config(function myAppConfig($stateProvider, $urlRouterProvider, $locationProvider) {
    $locationProvider.hashPrefix('!');
})
        .run(function run(titleService, $rootScope, $state, $stateParams) {
    $rootScope.$state = $state;
    $rootScope.$stateParams = $stateParams;
    titleService.setSuffix(' | The Anchor-OTR');
    $state.transitionTo("home");
}).controller('AppCtrl', function AppCtrl($scope, titleService, menuCollapseService, authService, navCollapseService, $state, $modal) {
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
            // send the mail off...
        });
    }

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





