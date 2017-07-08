// public/js/appRoutes.js
    angular.module('appRoutes', []).config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {

    $routeProvider

        // home page
        .when('/', {
            templateUrl: 'views/index.html',
            controller: 'MainController'
        })

        // starships page that will use the StarshipController
        .when('/starships', {
            templateUrl: 'views/starships.html',
            controller: 'StarshipController'
        });

    $locationProvider.html5Mode(true);

}]);