$ ->
  Admin.initCitySelectHelper()

Admin =
  init: () ->

    


  initCitySelectHelper: ->
    $('.city_select_helper').on 'change', ->
      window.location.search = "state=#{$(this).val()}"

window.Admin = Admin