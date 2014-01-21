Rmap =

  initialize: ->
    @options =
      center: new google.maps.LatLng(41.850033, -87.6500523),
      zoom: 3
      maxZoom: 18

    @bounds = new google.maps.LatLngBounds()

    unless $('#map-canvas').length = 0
      @map = new google.maps.Map document.getElementById('map-canvas'), Rmap.options

      $('.business[data-lat][data-lng]').each ->
        latlng = new google.maps.LatLng $(this).attr('data-lat'), $(this).attr('data-lng')
        marker = new google.maps.Marker
          position: latlng
          map: Rmap.map
          title: $(this).find('.business-name').text()
        Rmap.bounds.extend latlng

      unless Rmap.bounds.isEmpty()
        Rmap.map.fitBounds Rmap.bounds



window.Rmap = Rmap
