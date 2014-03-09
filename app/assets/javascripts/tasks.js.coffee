# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ = jQuery

$(document).ready ->
      
  newTask = (event, data) ->
    $(event.currentTarget).find('#task_title').val('')
    
    t = $(data.html)
    t.hide()
    $('.list-tasks .list-group').append(t)
    t.fadeIn(300)
    return
    

  toggleTask = (event, data) ->
    $(event.currentTarget).parent().parent().fadeOut 300, () ->
      $(this).remove()
      return
    
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
  
  deleteTask = (event, data) ->
    $(event.currentTarget).parent().parent().fadeOut 300, () ->
      $(this).remove()
      return
    return
        
  $(document).on 'ajax:success', '.new_task', newTask
  $(document).on 'ajax:success', '.toggle', toggleTask
  $(document).on 'ajax:success', '.delete_task', deleteTask
  
  return