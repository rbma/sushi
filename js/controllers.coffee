'use strict'

sushiControllers = angular.module('sushiControllers', [])



sushiControllers.controller('IndexCtrl', [
	'$scope'
	'$rootScope'
	'$http'
	'$sce'
	'$timeout'
	'contentfulClient'
	'brightCoveService'
	($scope, $rootScope, $http, $sce, $timeout, contentfulClient, brightCoveService) ->

		$scope.player0 = {}
		$scope.player1 = {}
		player = {}
		$scope.sushi = {}
		$scope.videReady = true
		$scope.defaultEpisode = 3843098628001
		$scope.clicked0 = false
		$scope.videoPlaying = false

		#background-image

		
		contentfulClient.entries({'content_type': '1aSBU2rdZSKAUK4GUQ8iKy','include': 1}).then (data) ->
			$scope.sushi = data[0]
			console.log $scope.sushi
			# brightCoveService1.init()
			$timeout ->
				brightCoveService.init($scope.defaultEpisode)
			

		
		
		#on player loaded, grab a reference to the player
		$rootScope.$on('playerready', (data, player) ->
			$scope.player = player
		)



		$scope.switchVid = (episode) ->
			$scope.player.loadVideoByID(episode)


		$scope.playVideo = (id) ->
			$scope.player.loadVideoByID(id)
			$scope.videoPlaying = true

		$scope.closePlayer = ->
			$scope.player.pause()
			$scope.videoPlaying = false


		#allow editors html
		$scope.trust = (body) ->
			return $sce.trustAsHtml(body)

])








sushiControllers.controller('InfoControl', [
	'$scope'
	'$http'
	'contentfulClient'
	($scope, $http, contentfulClient) ->

		$scope.sushi = {}


		contentfulClient.entries({'sys.id': 'RSlBbwxiQ622C6iiwOG2e','include': 1}).then (data) ->
			$scope.sushi = data[0]
			console.log $scope.sushi
			
])








sushiControllers.controller('InfoCtrl', [
	'$scope'
	'$http'
	'contentfulClient'
	($scope, $http, contentfulClient) ->
		$scope.yo = ''
])