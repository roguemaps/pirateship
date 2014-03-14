# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.sword').hover -> $('.sword_content').toggleClass('hover')
  $('.bg').hover -> $('.bg_content').toggleClass('hover')
  $('.unicorns').hover -> $('.unicorns_content').toggleClass('hover')
  $('.x').hover -> $('.x_content').toggleClass('hover')