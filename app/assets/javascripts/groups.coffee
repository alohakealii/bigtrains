# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	# Make group-info divs links to the group
	$('.group-info').on 'click', (e) ->
		window.location.assign( $(this).attr('href') )
		# console.log($(this).attr('href'))

	# Make users primary group stand out
	primary_group_id = $('.primary-group-id').text()
	$('#' + primary_group_id).css('background-color', 'yellow')
		.mouseover (e) ->
			$(this).css('background-color', 'green')
		.mouseout (e) ->
			$(this).css('background-color', 'yellow')