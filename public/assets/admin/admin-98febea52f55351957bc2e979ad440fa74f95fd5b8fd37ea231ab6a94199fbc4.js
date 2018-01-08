(function() {
  var Admin;

  Admin = {
    init: function() {},
    initCitySelectHelper: function() {
      return $('.city_select_helper').on('change', function() {
        return window.location.search = "state=" + ($(this).val());
      });
    },
    geocode_biz: function() {
      var addr, city, geocoder;
      geocoder = new google.maps.Geocoder();
      city = $('#business_city_id option:selected').text();
      addr = $('#business_formatted_address').val();
      return geocoder.geocode({
        address: addr + city
      }, function(results, status) {
        console.log(results);
        if (status === google.maps.GeocoderStatus.OK) {
          $('#business_lat').val(results[0].geometry.location.lat());
          return $('#business_lng').val(results[0].geometry.location.lng());
        } else {
          return alert('Geocoding Failed');
        }
      });
    },
    searchGoogle: function(form) {
      var request, service;
      service = new google.maps.places.PlacesService(Rmap.map);
      request = {
        query: $('#query').val()
      };
      service.textSearch(request, Admin.searchCallback);
      return false;
    },
    searchCallback: function(results, status) {
      var address, business, form, i, len, resultContainer;
      resultContainer = $('.search-results').html('');
      for (i = 0, len = results.length; i < len; i++) {
        business = results[i];
        form = $('#new_business').clone().show().appendTo(resultContainer);
        form.find('#business_name').val(business.name);
        address = business.formatted_address.split(",");
        form.find('#business_formatted_address').val(address.shift());
        form.find('#city_name').val(address.slice(0, 2).join(" "));
        form.find('#business_lat').val(business.geometry.location.lat());
        form.find('#business_lng').val(business.geometry.location.lng());
      }
      return resultContainer.find('form').on('ajax:success', function(data, result, xhr) {
        var win;
        win = window.open();
        win.document.open();
        win.document.write(result);
        return win.document.close();
      });
    }
  };

  window.Admin = Admin;

  $(function() {
    return Admin.initCitySelectHelper();
  });

}).call(this);
