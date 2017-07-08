// public/js/services/StarshipService.js
angular.module('StarshipService', []).factory('Starship', ['$http', function($http) {

    return {
        // call to get all starships
        get : function() {
            return $http.get('/api/starships');
        },

        // these will work when more API routes are defined on the Node side of things
        // call to POST and create a new nerd
        read : function(starshipData) {
            return $http.post('/api/starships', starshipData);
        },
    }       

}]);