# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Rsearch = 

  $ ->
    $('form#tag-filter').on 'change', (e) ->
      tags = $(this).find('input:checked').map ->
        $(this).val()
      $('form.search #filter_tags').val tags.toArray().join()
      $('form.search').submit()

window.Rsearch = Rsearch

$('.business row').hover ->
  $(this).toggleClass '.business_hover'
  return