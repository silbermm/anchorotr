'use strict';
angular.module('anchorotr.reservation', [
    'ui.state',
    'titleService',
    'menuCollapseService',
    'ui.bootstrap'
]).config(function config($stateProvider) {
    $stateProvider.state('reservation', {
        url: '/reservation',
        views: {
            "main": {
                controller: "ReservationCtrl",
                templateUrl: 'resources/js/reservation/reservation.tpl.html'
            }
        }
    })
}).controller('ReservationCtrl', function ReservationController($scope, titleService, menuCollapseService, $timeout) {
    titleService.setTitle("Reservations");
    menuCollapseService.setCollapsed(true);

    $scope.today = function() {
        $scope.dt = new Date();
    };
    $scope.today();

    $scope.showWeeks = false;
    $scope.toggleWeeks = function() {
        $scope.showWeeks = !$scope.showWeeks;
    };

    $scope.clear = function() {
        $scope.dt = null;
    };

    $scope.toggleMin = function() {
        $scope.minDate = ($scope.minDate) ? null : new Date();
    };
    $scope.toggleMin();

    $scope.open = function() {
        $timeout(function() {
            $scope.opened = true;
        });
    };

})

