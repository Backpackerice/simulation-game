angular.module('simulationGame',['ngRoute', 'simulationGame.controllers'])
.config(function($routeProvider){
  $routeProvider.when('/',{
    templateUrl: '/templates/dashboard.html',
    controller: 'HomeController'
    })
    .otherwise({redirectTo:'/'});
});
