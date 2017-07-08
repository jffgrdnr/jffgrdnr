var app = angular.module('swapi', []);

app.controller('MainCtrl', [
	'$scope',
	function($scope) {
		$scope.starship = 'Landing Craft';
	}
])