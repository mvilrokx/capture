# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('a.side-tab').on('click', (e) ->
		$('.slide-list').toggle("slide")
		e.preventDefault()
	)

$ ->
	$('#clickme').toggle( ->
		$(this).parent().animate({left:'0px'}, {queue:false, duration: 300, 'bounce'})
	, ->
		$(this).parent().animate({left:'-282px'}, {queue:false, duration: 300, 'bounce'})
	)