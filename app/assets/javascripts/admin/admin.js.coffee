
Admin =
  init: () ->

  initCitySelectHelper: ->
    $('.city_select_helper').on 'change', ->
      window.location.search = "state=#{$(this).val()}"

  geocode_biz: ->
    geocoder = new google.maps.Geocoder();
    city = $('#business_city_id option:selected').text()
    addr = $('#business_formatted_address').val()
    geocoder.geocode address: addr + city, (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        $('#business_lat').val results[0].geometry.location.lat()
        $('#business_lng').val results[0].geometry.location.lng()
      else
        alert 'Geocoding Failed'

window.Admin = Admin

$ ->
  Admin.initCitySelectHelper()