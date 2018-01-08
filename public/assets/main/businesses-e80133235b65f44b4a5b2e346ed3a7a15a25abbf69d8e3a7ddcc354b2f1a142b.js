(function() {
  var Rsearch;

  Rsearch = $(function() {
    return $('form#tag-filter').on('change', function(e) {
      var tags;
      tags = $(this).find('input:checked').map(function() {
        return $(this).val();
      });
      $('form.search #filter_tags').val(tags.toArray().join());
      return $('form.search').submit();
    });
  });

  window.Rsearch = Rsearch;

  $('.business row').hover(function() {
    $(this).toggleClass('.business_hover');
  });

}).call(this);
