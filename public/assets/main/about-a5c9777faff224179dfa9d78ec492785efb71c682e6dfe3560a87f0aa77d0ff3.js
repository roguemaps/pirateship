(function() {
  $(function() {
    $('.sword').hover(function() {
      return $('.sword_content').toggleClass('hover');
    });
    $('.bg').hover(function() {
      return $('.bg_content').toggleClass('hover');
    });
    $('.unicorns').hover(function() {
      return $('.unicorns_content').toggleClass('hover');
    });
    return $('.x').hover(function() {
      return $('.x_content').toggleClass('hover');
    });
  });

}).call(this);
