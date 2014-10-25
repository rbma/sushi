'use strict'

sushiControllers = angular.module('sushiControllers', [])



sushiControllers.controller('IndexCtrl', [
	'$scope'
	'$rootScope'
	'$http'
	'contentfulClient'
	'brightCoveService'
	($scope, $rootScope, $http, contentfulClient, brightCoveService) ->

		$scope.player = {}
		$scope.sushi = {}

		
		contentfulClient.entries({'content_type': '1aSBU2rdZSKAUK4GUQ8iKy','include': 1}).then (data) ->
			$scope.sushi = data[0]
			console.log $scope.sushi
			
			#set up all brightcove params
			brightCoveService.init($scope.sushi.fields.brightcoveId1)

		
		
		#on player loaded, grab a reference to the player
		$rootScope.$on('playerready', (data, player) ->
			$scope.player = player
		)

		$scope.switchVid = (episode) ->
			$scope.player.loadVideoByID(episode)

])








sushiControllers.controller('InfoCtrl', [
	'$scope'
	'$http'
	'contentfulClient'
	($scope, $http, contentfulClient) ->
		$scope.yo = ''
])