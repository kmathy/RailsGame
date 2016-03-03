# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->

  ajaxCache = {}

  doAjax = (url) ->
    if !ajaxCache[url]
      ajaxCache[url] = $.get(url)
    ajaxCache[url].done (html) ->
      $('#content').html($(html).find("#body"))


  ########## LISTENERS ########

  $("#best_players").on 'click', (e) ->
    e.preventDefault()
    url = $(this).attr('href')
    doAjax(url)

  $("#best_players_tournament").on 'click', (e) ->
    e.preventDefault()
    url = $(this).attr('href')
    doAjax(url)

  $("#best_players_game").on 'click', (e) ->
    e.preventDefault()
    url = $(this).attr('href')
    doAjax(url)