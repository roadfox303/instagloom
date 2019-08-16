(function( $ ){
  $.fn.autoSquare = function() {
    let _this = $(this);
    _this.css({'height':_this.width()});
    $(window).on("load resize",function () {
      _this.css({'height':_this.width()});
    });
  };
})( jQuery );
