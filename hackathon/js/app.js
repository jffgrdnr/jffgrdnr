var App = angular.module('App', []);

App.controller('ViewerCtrl', function($scope, $http, $log) {
  $http.get('records.json')
       .then(function(res){
          $scope.records = res.data; 
          $log(res);               
        });
});