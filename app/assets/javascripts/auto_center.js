(function( $ ){
  $.fn.autoCenter = function() {
    let _this = $(this);
    $(window).on("load resize",function () {
      let parent_height = _this.parent().height();
      let parent_width = _this.parent().width();
      let this_height = _this.height();
      let this_width = _this.width();
      _this.css({
        'position':'absolute',
        'top': ((parent_height - this_height) / 2),
        'left': ((parent_width - this_width) / 2),
      });
    });
  };
})( jQuery );
