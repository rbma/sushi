'use strict'

sushiControllers = angular.module('sushiControllers', [])



sushiControllers.controller('IndexCtrl', [
	'$scope'
	'$rootScope'
	'$http'
	'$sce'
	'contentfulClient'
	($scope, $rootScope, $http, $sce, contentfulClient) ->

		$scope.player = {}
		$scope.sushi = {}
		$scope.videReady = true
		$scope.defaultEpisode = 3843098628001
		$scope.clicked0 = false
		$scope.videoPlaying = false

		#background-image




		$scope.$watch('playing', ->
			console.log $scope.playing
		)


		
		contentfulClient.entries({'content_type': '1aSBU2rdZSKAUK4GUQ8iKy','include': 1}).then (data) ->
			$scope.sushi = data[0]
			console.log $scope.sushi
			

		
		
		#on player loaded, grab a reference to the player
		$rootScope.$on('playerready', (data, player) ->
			$scope.player = player
		)

		$scope.switchVid = (episode) ->
			$scope.player.loadVideoByID(episode)


		$scope.playVideo = (index) ->
			$scope.videoPlaying = true
			if index == 0
				$scope.clicked0 = true
			if index == 1
				$scope.clicked1 = true
			if index == 2
				$scope.clicked2 = true
			else
				return

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