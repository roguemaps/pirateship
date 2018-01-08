(function() {
  var Rmap;

  Rmap = {
    initialize: function() {
      this.options = {
        center: new google.maps.LatLng(41.850033, -87.6500523),
        zoom: 3,
        maxZoom: 18,
        panControl: false,
        zoomControlOptions: {
          position: google.maps.ControlPosition.LEFT_TOP
        },
        scrollwheel: false
      };
      this.bounds = new google.maps.LatLngBounds();
      if (!($('#map-canvas').length = 0)) {
        this.map = new google.maps.Map(document.getElementById('map-canvas'), Rmap.options);
        $('.business[data-lat][data-lng]').each(function() {
          var latlng, marker;
          latlng = new google.maps.LatLng($(this).attr('data-lat'), $(this).attr('data-lng'));
          marker = new google.maps.Marker({
            position: latlng,
            map: Rmap.map,
            title: $(this).find('.business-name').text(),
            icon: {
              url: image_path('map_marker.png')
            }
          });
          google.maps.event.addDomListener(document.getElementById($(this).find('.business-name').text()), 'mouseover', function() {
            marker.setIcon({
              url: image_path('marker_alt.png')
            });
          });
          google.maps.event.addDomListener(document.getElementById($(this).find('.business-name').text()), 'mouseout', function() {
            marker.setIcon({
              url: image_path('map_marker.png')
            });
          });
          return Rmap.bounds.extend(latlng);
        });
        if (!Rmap.bounds.isEmpty()) {
          return Rmap.map.fitBounds(Rmap.bounds);
        }
      }
    }
  };

  window.Rmap = Rmap;

}).call(this);
