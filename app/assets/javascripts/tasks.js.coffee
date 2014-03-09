# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ = jQuery

$(document).ready ->

  toggleTask = (event, data) ->
    $(event.currentTarget).parent().parent().remove()
    
    t = $(data.html)
    t.hide()
    
    if !data.task.complete
      $('.list-tasks .list-group').append(t)
    else
      $('.list-tasks-completed .list-group').append(t)
    
    if $('.list-tasks-completed .list-group li').length > 0
      $('.list-tasks-completed').show()
    else
      $('.list-tasks-completed').hide()
    
    t.fadeIn(300)
    return
    
  $(document).on 'ajax:success', '.toggle', toggleTask
  
  return