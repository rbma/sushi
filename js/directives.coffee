sushiDirectives = angular.module('sushiDirectives', [])


sushiDirectives.directive('fullsize', ->

	link = ($scope, element, attrs) ->
		width = $(window).width()
		height = $(window).height()

		element.css
			width: width
			height: height
			backgroundColor: 'white'
			top: 0

	return{
		link: link
	}

)

