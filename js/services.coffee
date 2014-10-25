sushiServices = angular.module('sushiServices', [])

sushiServices.factory('brightCoveService', ['$rootScope', ($rootScope) ->

	#used to hold all brightcove params
	playerData = {}
	playerTemplate = ""
	player = {}
	APIModules = {}
	modVP = {}
	videoPlayer = {}
	vidRatio = 640 / 360

	width =  $(window).width() / 2
	height = ($(window).width() / 2) / vidRatio


	addPlayer = ->
		template = Handlebars.compile(playerTemplate)
		playerHTML = template(playerData)
		document.getElementById('player').innerHTML = playerHTML
		#instantiate player
		brightcove.createExperiences()


	
	init = (videoId) ->
		playerData = {
			"playerID" : "1890493041001",
			"playerKey" : "AQ~~%2CAAABuJ3Komk~%2CgXybzBdQzgLgC0zHvAZXtMeryIVplW-t",
			"width" : width
			"height" : height
			"videoID" : "#{videoId}"
		}

		playerTemplate = "<div style=\"display:none\"></div><object id=\"myExperience\" class=\"BrightcoveExperience\"><param name=\"bgcolor\" value=\"#FFFFFF\" /><param name=\"width\" value=\"{{width}}\" /><param name=\"height\" value=\"{{height}}\" /><param name=\"playerID\" value=\"{{playerID}}\" /><param name=\"playerKey\" value=\"{{playerKey}}\" /><param name=\"isSlim\" value=\"true\" /><param name=\"autoStart\" value=\"false\" /><param name=\"isVid\" value=\"true\" /><param name=\"isUI\" value=\"true\" /><param name=\"dynamicStreaming\" value=\"true\" /><param name=\"@videoPlayer\" value=\"{{videoID}}\"; /><param name=\"includeAPI\" value=\"true\" /><param name=\"linkBaseURL\" value=\"http://www.redbullmusicacademy.com/magazine/diggin-in-the-carts\"/><param name=\"templateLoadHandler\" value=\"onTemplateLoad\" /><param name=\"templateReadyHandler\" value=\"onTemplateReady\" /></object>"

		addPlayer()


	#LISTENERS
	window.onTemplateLoad = (experienceID) ->
		player = brightcove.api.getExperience(experienceID)
		APIModules = brightcove.api.modules.APIModules
		modVP = player.getModule(brightcove.api.modules.APIModules.VIDEO_PLAYER)


	window.onTemplateReady = (evt) ->
		videoPlayer = player.getModule(APIModules.VIDEO_PLAYER)

		#broadcast message to controller that we can now get reference to player
		$rootScope.$broadcast('playerready', videoPlayer)

		# resizePlayer($('#myExperience'))
		modVP.addEventListener(brightcove.api.events.MediaEvent.BEGIN, onMediaEventFired)
		modVP.addEventListener(brightcove.api.events.MediaEvent.CHANGE, onMediaEventFired)
		modVP.addEventListener(brightcove.api.events.MediaEvent.COMPLETE, onMediaEventFired)
		modVP.addEventListener(brightcove.api.events.MediaEvent.ERROR, onMediaEventFired)
		modVP.addEventListener(brightcove.api.events.MediaEvent.PLAY, onMediaEventFired)
		#modVP.addEventListener(brightcove.api.events.MediaEvent.PROGRESS, onMediaProgressFired)
		modVP.addEventListener(brightcove.api.events.MediaEvent.STOP, onMediaEventFired)








	return{
		init: (videoId)->
			init(videoId)

	}

])


