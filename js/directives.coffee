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


sushiDirectives.directive('shrink', ->

	

	link = ($scope, element, attrs) ->
		calc = ->
			width = $(window).width()

			newWidth = width - 28

			element.css
				width: newWidth + 'px'
				left: '14px'

		calc()

		$(window).resize ->
			calc()

		

	return{
		link: link
	}

)

