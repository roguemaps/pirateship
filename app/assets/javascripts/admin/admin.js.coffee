
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


  searchGoogle: (form) ->
    service = new google.maps.places.PlacesService(Rmap.map)
    request = query: $('#query').val()

    service.textSearch request, Admin.searchCallback

    return false

  searchCallback: (results, status) ->
    resultContainer = $('.search-results').html('')
    for business in results
      form = $('#new_business').clone().show().appendTo(resultContainer)
      form.find('#business_name').val(business.name)

      address = business.formatted_address.split(",")

      form.find('#business_formatted_address').val(address.shift())
      form.find('#city_name').val(address[0..1].join(" "))

      form.find('#business_lat').val(business.geometry.location.lat())
      form.find('#business_lng').val(business.geometry.location.lng())

    resultContainer.find('form').on 'ajax:success', (data, result, xhr) ->
      win = window.open()
      win.document.open()
      win.document.write result
      win.document.close()
      

window.Admin = Admin

$ ->
  Admin.initCitySelectHelper()