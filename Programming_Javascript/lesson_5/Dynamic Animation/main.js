$(function() {
  var $canvas = $(".background");
  

  function getFormObject($form) {
    var o = {};
    console.log($form.serializeArray());
    $form.serializeArray().forEach(function(input) {
      o[input.name] = input.value;
    });

    return o;

  }

  function createElement(data) {
    var new_div = $("<div></div>", {
      "class": data.shape_type,
      data: data
    });

    resetElement(new_div);
    return new_div;
  }

  function animateElement() {
    var $e = $(this);
    var data = $e.data();
    
    resetElement($e);
    $e.animate({
      left: +data.end_x,
      top: +data.end_y
    },1000);
    
    
  }

  function resetElement($e) {
    var data = $e.data();
    $e.css({
      left: +(data.start_x),
      top: +(data.start_y)
    });

  }

  $("form").on("submit", function(e) {
    e.preventDefault();

    var $form = $(this);
    var  data = getFormObject($form);
    console.log(data);
    
   $canvas.append(createElement(data));
    

  });

  $(".start").on("click",function(eventObj) {
    eventObj.preventDefault();

    $canvas.find("div").each(animateElement);

  });
});