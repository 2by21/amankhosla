window.App ||= {}
class App.Users extends App.Base

	home: =>
		$ ->
			$('ul.nav a').bind 'click', (event) ->
				$anchor = $(this)

				$('html, body').stop().animate({
					scrollLeft: $($anchor.attr('href')).offset().left
				}, 1000)

				event.preventDefault()