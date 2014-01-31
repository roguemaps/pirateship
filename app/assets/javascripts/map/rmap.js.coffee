Rmap =

  initialize: ->
    @options =
      center: new google.maps.LatLng(41.850033, -87.6500523),
      zoom: 3
      maxZoom: 18
      zoomControlOptions:
        # style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR
        position: google.maps.ControlPosition.LEFT_BOTTOM
      panControlOptions:
        position: google.maps.ControlPosition.LEFT_BOTTOM
    
    


    @bounds = new google.maps.LatLngBounds()

    unless $('#map-canvas').length = 0
      @map = new google.maps.Map document.getElementById('map-canvas'), Rmap.options

      $('.business[data-lat][data-lng]').each ->
        latlng = new google.maps.LatLng $(this).attr('data-lat'), $(this).attr('data-lng')
        marker = new google.maps.Marker
          position: latlng
          map: Rmap.map
          title: $(this).find('.business-name').text()
          icon: 
            url: image_path('map_marker.png')
            scaledSize: new google.maps.Size(25, 25)
            

        Rmap.bounds.extend latlng

      unless Rmap.bounds.isEmpty()
        Rmap.map.fitBounds Rmap.bounds



window.Rmap = Rmap
