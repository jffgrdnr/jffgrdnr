var App = angular.module('App', []);

App.controller('ViewerCtrl', function($scope, $http, $log) {

	//newRecords.json
	$http.get('http://10.9.1.54/cgi-bin/neighbors/GetPeopleOnSheet.pl?dbid=2442&imageid=m-t0627-04213-00502')
       .then(function(res){
          $scope.newRecords = res.data.Records; 
          $.each($scope.newRecords, function(recordIndex, recordElement){
          		$scope.people = recordElement;
          		//console.log($scope.people); 
          		$.each($scope.people, function(peopleIndex, peopleElement){
	          		$scope.details = peopleElement;
			    });
		    });          
        });
});

App.controller('RouteCtrl', ['$scope', '$routeParams',
   function ($scope, $routeParams) {
      //Get ID out of current URL
      var currentId = $routeParams.id;
      
}]);

