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
		$scope.currentVideo = ""

		#background-image

		
		contentfulClient.entries({'content_type': '1aSBU2rdZSKAUK4GUQ8iKy','include': 1}).then (data) ->
			$scope.sushi = data[0]
			console.log $scope.sushi
			# brightCoveService1.init()
			$timeout ->
				brightCoveService.init($scope.defaultEpisode)
			, 1000


			

		
		
		#on player loaded, grab a reference to the player
		$rootScope.$on('playerready', (data, player) ->
			$scope.player = player
		)



		$scope.switchVid = (episode) ->
			$scope.player.loadVideoByID(episode)
			$scope.currentVideo = episode


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
	'$sce'
	'contentfulClient'
	'webgl'
	($scope, $http, $sce, contentfulClient, webgl) ->

		$scope.sushi = {}

		converter = new Showdown.converter()

		$scope.threed = webgl.checkWebGL()

		$scope.webglsupport = false

		if $scope.threed == false
			$scope.webglsupport = false
		else
			$scope.webglsupport = true


		$scope.$watch('webglsupport', ->
			console.log $scope.webglsupport
		)





		contentfulClient.entries({'sys.id': 'RSlBbwxiQ622C6iiwOG2e','include': 1}).then (data) ->
			$scope.sushi = data[0]

			$scope.sushi.fields.infoDescription = converter.makeHtml($scope.sushi.fields.infoDescription)



		#allow editors html
		$scope.trust = (body) ->
			return $sce.trustAsHtml(body)

			
])




