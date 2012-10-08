# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
  $('.btn[data-remote], a[data-remote]').bind('ajax:success', (evt, data, status, xhr) -> 
    $('.modal-body').append(xhr.responseText)
    $('.modal-header h3').text($('.modal-body').find('legend').text())
    # $('.modal-footer').html($('.modal-body').find('.form-actions').html())
    # $('.modal-body').find('legend, .form-actions').remove()
    $('.modal-body').find('legend').remove()
    $('#modal-form').modal()
  )

$ -> 
		$("a[rel='popover']").popover()