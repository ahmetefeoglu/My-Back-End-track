
$(function() {

  var canvas = document.querySelector("canvas");
  var ctx = canvas.getContext("2d");

  var drawing_methods = {

    square: function(e) {

      var side = 30;
      var x = e.offsetX - side/2;
      var y = e.offsetY - side/2;
      ctx.fillRect(x,y,side,side);
    },

    circle: function(e) {
      ctx.beginPath();

      var x = e.offsetX;
      var y = e.offsetY;
      var radius = 15;
      ctx.arc(x,y,radius,0,2*Math.PI);
      ctx.fill();
      ctx.closePath();
    },

    triangle: function(e) {
      var side = 30;
      var x = e.offsetX;
      var y = e.offsetY - side/2;
      ctx.beginPath();
      ctx.moveTo(x,y);
      ctx.lineTo(x + side/2, y + side);
      ctx.lineTo(x - side/2, y + side);
      ctx.fill(); // It closes the last line for us
      ctx.closePath();

    },

    clear: function(e) {
      e.preventDefault();
      ctx.clearRect(0,0, canvas.width, canvas.height);
    }

  };

  $("ul").on("click", "a.drawing_method", function(e) {
    e.preventDefault();
    var $e = $(this);
    method = $e.attr("data-method");
    var class_name = "active";
    $e.closest("ul").find("." + class_name).removeClass(class_name);
    $e.addClass(class_name);

  });

  $("#clear").on("click", function(e) {
    drawing_methods.clear(e);
  });

  $("canvas").on("click",function(e) {
      var color = $("input").val();
      
      ctx.fillStyle = color;
      drawing_methods[method](e);
  });
})


