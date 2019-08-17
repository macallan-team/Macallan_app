# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  el = document.getElementById("sortable_list")
  if el != null
    sortable = Sortable.create(el,
      delay: 200,
      onUpdate: (evt) ->
        $.ajax
          url: 'manage_item/' + $("#song_id").val() + '/sort'
          type: 'patch'
          data: { from: evt.oldIndex, to: evt.newIndex }
    )