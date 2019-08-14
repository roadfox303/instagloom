(function( $ ){
  $.fn.autoSquare = function() {
    let _this = $(this);
    $(window).on("load resize",function () {
      _this.css({'height':_this.width()});
    });
  };
})( jQuery );
