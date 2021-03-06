'use strict'

app = angular.module('sushi', [
	'ngRoute'
	'ngSanitize'
	'ng-contentful'
	'duScroll'
	'sushiControllers'
	'sushiDirectives'
	'sushiServices'
	]
)




app.config(['$routeProvider', '$locationProvider', 'contentfulClientProvider', '$sceDelegateProvider'
	
	($routeProvider, $locationProvider, contentfulClientProvider, $sceDelegateProvider) ->

		$routeProvider.when('/', {
			templateUrl: 'partials/index.html',
			controller: 'IndexCtrl'
			})
		
		.when('/info', {
			templateUrl: 'partials/info.html',
			controller: 'InfoControl'
			})
		
		.otherwise({
			redirectTo: '/'
			})


		contentfulClientProvider.setSpaceId('4xlwm16911zp')
		contentfulClientProvider.setAccessToken('6fe66430d43042a7c28777422e4ae6f8edf5f58bf05d46a072e92a83bf432dab')
	

])