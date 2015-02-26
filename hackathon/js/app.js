var App = angular.module('App', []);

App.controller('ViewerCtrl', function($scope, $http, $log) {
  $http.get('js/records.json')
       .then(function(res){
          $scope.records = res.data;            
        });
});

App.directive('fallbackSrc', function () {
    var fallbackSrc = {
        link: function postLink(scope, iElement, iAttrs) {
            iElement.bind('error', function() {
                angular.element(this).attr("src", iAttrs.fallbackSrc);
            });
        }
    }
    return fallbackSrc;
});