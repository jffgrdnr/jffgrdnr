var app = angular.module('swapi', []);

app.controller('MainCtrl', [
	'$scope',
	function($scope) {
		$scope.tagline = 'Welcome to the Star Wards API!';
	}
])