// Main Controller

angular.module('swapi', ['xyz.angular.swapi']).
 
controller('MainCtrl', ['swapiService', 
  function($scope, swapiService) {
    // get starship data 
    swapiService.starship('1').
    then(function(starshipData){
      $scope.starship = starshipData;
    });
  }
])