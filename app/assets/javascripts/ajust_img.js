(function( $ ){
  $.fn.ajustImg = function() {
    let img = $(this);
    let box = img.parent();
    let box_aspect = aspect_ratio(box);
    let img_aspect = aspect_ratio(img);
    let ajust = ajust_direction(box_aspect,img_aspect);
    if (ajust == "x"){
      img.css({'width':'100%'});
      let shift_y = (img.height() - box.height()) / 2;
      img.css({'margin-top': -shift_y });
    }else{
      img.css({'height':'100%'});
      let shift_x = (img.width() - box.width()) / 2;
      img.css({'margin-left': -shift_x });
    }
    function aspect_ratio(object){
      return object.width() / object.height();
    }
    function ajust_direction(b,i){
      let direction;
      switch(true){
        case b == 1:
          if (i > 1){
            direction = "y";
          }
          else{
            direction = "x";
          }
          break;
        case b > 1:
          if (b > i){
            direction = "x";
          }else {
            direction = "y";
          };
          break;
        case b < 1:
          if (b > i){
            direction = "y";
          }else {
            direction = "x";
          };
          break;
      }
      return direction;
    }
  };
})( jQuery );
