'use strict';
angular.module('authService', []).factory('authService', function($http) {
    var auth = {
        authenticated: false,
        username: null,
        role: "anonymous",
        admin: false
    };
    return {
        getDetails: function(){
            $http.get('/users/authorities').success(function(data, status, headers, config) {
                for(var i = 0; i < data.length; i++){
                    if(data[i].authority === "Administrator"){
                        auth.admin = true;
                    }
                }
            }).error(function(data, status, headers, config) {
                auth.admin = false;
            }); 
            $http.get('/users/username').success(function(data, status, headers, config){
               auth.username = data;
               auth.authenticated = true;
            }).error(function(data, status, headers, config){
                auth.username = "";
                auth.authenticated = false;
            });
            
        },
        isAdmin: function() {                    
            return auth.admin;
        },
        isAuthenticated: function() {
            return auth.authenticated;
        },
        getUsername: function() {
            return auth.username;
        }
    }
})

