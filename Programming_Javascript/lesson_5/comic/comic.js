$(function() {
  var $blinds = $("[id ^= blind]");
  var speed = 250,
      delay = 1500;
      
  animateAll($blinds);
  $("li a").on("click",  function(eventObj) {
    eventObj.preventDefault();
    $blinds.removeAttr("style");
    animateAll($blinds);
  });

  function animateAll(blinds) {
    blinds.each(function(index) {
      var $blind = blinds.eq(index);
      $blind.delay(delay * index + 250).animate({
        top: "+=" + $blind.height(),
        height: 0
      },250);
    });

  };
});