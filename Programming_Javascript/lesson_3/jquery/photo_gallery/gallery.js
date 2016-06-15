$(function() {
  var $slide_show = $(".slideshow");
  var $nav = $("ul");

  
  $nav.on("click", "a", function(e) {
    e.preventDefault();
    var $li = $(e.currentTarget).closest("li");
    var indx = $li.index();

    $slide_show.find("figure").filter(":visible").slideToggle();
    $slide_show.find("figure").eq(indx).delay(300).slideToggle();
    
    
    
  });

});