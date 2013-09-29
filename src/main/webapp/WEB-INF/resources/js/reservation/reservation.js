'use strict';
angular.module('anchorotr.reservation', [
    'ui.state',
    'titleService',
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
}).controller('ReservationCtrl', function ReservationController($scope, titleService) {
    

})
