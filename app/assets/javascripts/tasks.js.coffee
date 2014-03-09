# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ = jQuery

$(document).ready ->
      
  newTask = (event, data) ->
    $(event.currentTarget).find('#task_title').val('')
    
    t = $(data.html)
    t.hide()
    
    c = data.taskCount
    
    $('.list-tasks .list-group').append(t)
    t.fadeIn(300)
    
    $('.menu-list-' + data.task.list_id).find('.label').html(c)
    if c == 0
      $('.menu-list-' + data.task.list_id).find('.label').hide()
    else
      $('.menu-list-' + data.task.list_id).find('.label').show()
    return
      
  toggleTaskBefore = (event) ->
    self = $(event.currentTarget)
    if self.find('.glyphicon-unchecked').length > 0
      self.html('<span class="glyphicon glyphicon-check"></span>')
    else
      self.html('<span class="glyphicon glyphicon-unchecked"></span>')
      
    return

  toggleTaskError = (event) ->
    toggleTaskBefore(event)
    return

  toggleTask = (event, data) ->
    $(event.currentTarget).parent().parent().fadeOut 300, () ->
      $(this).remove()
      
      t = $(data.html)
      t.hide()
      
      c = data.taskCount
    
      if !data.task.complete
        $('.list-tasks .list-group').append(t)
      else
        $('.list-tasks-completed .list-group').prepend(t)
    
      if $('.list-tasks-completed .list-group li').length > 0
        $('.list-tasks-completed').show()
      else
        $('.list-tasks-completed').hide()
    
      t.fadeIn(300)
      
      $('.menu-list-' + data.task.list_id).find('.label').html(c)
      if c == 0
        $('.menu-list-' + data.task.list_id).find('.label').hide()
      else
        $('.menu-list-' + data.task.list_id).find('.label').show()
      return
    return
  
  deleteTask = (event, data) ->
    $(event.currentTarget).parent().parent().fadeOut 300, () ->
      $(this).remove()
      return
    $('.menu-list-' + data.listId).find('.label').html(data.taskCount)
    if data.taskCount == 0
      $('.menu-list-' + data.listId).find('.label').hide()
    else
      $('.menu-list-' + data.listId).find('.label').show()
    return
    
    return
        
  $(document).on 'ajax:success', '.new_task', newTask
  $(document).on 'ajax:before', '.toggle', toggleTaskBefore
  $(document).on 'ajax:success', '.toggle', toggleTask
  $(document).on 'ajax:error', '.toggle', toggleTaskError
  $(document).on 'ajax:success', '.delete_task', deleteTask
  
  return