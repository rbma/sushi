'use strict'

app = angular.module('sushi', [
	'ngRoute'
	'ngSanitize'
	'ng-contentful'
	'sushiControllers'
	'sushiDirectives'
	'sushiServices'
	]
)

app.config(['$routeProvider', '$locationProvider', 'contentfulClientProvider', '$sceDelegateProvider',
	
	($routeProvider, $locationProvider, contentfulClientProvider, $sceDelegateProvider) ->

		$routeProvider.when('/', {
			templateUrl: 'partials/index.html',
			controller: 'IndexCtrl'
			})
		
		.when('/info', {
			templateUrl: 'partials/info.html',
			controller: 'InfoCtrl'
			})
		
		.otherwise({
			redirectTo: '/'
			})

		# $sceDelegateProvider.resourceUrlWhitelist({
		# 	'self',
		# 	'http://www.youtube.com/**'
		# 	'https://www.youtube.com/**'
		# 	})


		contentfulClientProvider.setSpaceId('4xlwm16911zp')
		contentfulClientProvider.setAccessToken('6fe66430d43042a7c28777422e4ae6f8edf5f58bf05d46a072e92a83bf432dab')

		

])