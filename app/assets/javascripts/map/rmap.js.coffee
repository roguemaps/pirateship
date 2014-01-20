Rmap =




  initialize: ->
    @options =
      center: new google.maps.LatLng(41.850033, -87.6500523),
      zoom: 3

    if $('#map-canvas')
      @map = new google.maps.Map document.getElementById('map-canvas'), Rmap.options

window.Rmap = Rmap
