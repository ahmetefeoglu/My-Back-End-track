$(function() {
  $("#team li > a").on("click", function(eventObj) {
    eventObj.preventDefault();
    var $element = $(this);
    var $close = $(".modal  .close");
    console.log($close);

    $($element).siblings(".modal").css({
      top: $(window).scrollTop() + 30
    });

    $($element).nextAll("div").fadeIn(400);


    $($close).on("click",function(e) {
      e.preventDefault();
      $($element).nextAll("div").fadeOut(400);

    })





  });


});
