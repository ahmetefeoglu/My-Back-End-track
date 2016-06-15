$(function() {
  
 
  $("nav").on("click", "a", function(e) {
    e.preventDefault();

    var $e = $(this);
    var indx = $e.closest("li").index();
    var class_name = "active";
    $("#tabs article").hide().eq(indx).show();
    $e.closest("nav").find("." + class_name).removeClass(class_name);
    $e.addClass(class_name);
    localStorage.setItem("active_nav", indx);

  });

  $(window).unload(function() {
    localStorage.setItem("note", $("textarea").val());
  })

  $(":radio").on("change", function() {
    var color = $(this).attr("value");
    $(document.body).css({background: color});
    localStorage.setItem("color", color);
  })
  setActiveNav(localStorage.getItem("active_nav"));
  setBackgroundColor(localStorage.getItem("color"));
  setNote(localStorage.getItem("note"));




});

function setActiveNav(indx) {
  if (indx === null) {return;}
  $("nav a").eq(indx).click();
}

function setBackgroundColor(color) {
  if (color === null) { return;}

  $("[value=" + color + "]").prop("checked", true).change();

}

function setNote(comment) {
  $("textarea").val(comment);
}