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

			player = $('#myExperience1890493041001')
			

		
		
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

		$scope.closePlayer = (index) ->
			$scope.videoPlaying = false
			if index == 0
				$scope.clicked0 = false
			if index == 1
				$scope.clicked1 = false
			if index == 2
				$scope.clicked2 = false
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