# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	# Make group-info divs links to the group
	$('.group-info').on 'click', (e) ->
		window.location.assign( $(this).attr('href') )
		# console.log($(this).attr('href'))

	# Make a div or something next to group-info divs to set as primary


	# Make users primary group stand out
