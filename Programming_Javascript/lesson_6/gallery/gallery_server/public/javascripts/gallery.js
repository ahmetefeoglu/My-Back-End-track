$(function() {
  var templates = {},
      photos;

  $("script[type = 'text/x-handlebars']").each(function() {
    var $tmpl = $(this);
    templates[$tmpl.attr("id")] = Handlebars.compile($tmpl.html());
  });
  
  $("[data-type=partial]").each(function() {
    var $partial = $(this);
    Handlebars.registerPartial($partial.attr("id"), $partial.html());
  });

  
  var slideshow = {
    $el: $("#slideshow"),
    duration: 500,

    nextSlide: function(e) {
      e.preventDefault();
      var $current_photo = this.$el.find("figure:visible"),
          $next_photo = $current_photo.next("figure");

      if(!$next_photo.length) {
        $next_photo = this.$el.find("figure").first();
      }

      $current_photo.fadeOut(this.duration);
      $next_photo.fadeIn(this.duration);
      this.renderPhotoContent($next_photo.attr("data-id"));
    },

    prevSlide: function(e) {
      e.preventDefault();
      var $current_photo = this.$el.find("figure:visible"),
          $prev_photo = $current_photo.prev("figure");
      
      if (!$prev_photo.length) {
        $prev_photo = this.$el.find("figure").last();
      }
     
      $current_photo.fadeOut(this.duration);
      $prev_photo.fadeIn(this.duration);
      this.renderPhotoContent($prev_photo.attr("data-id"));
    },

    renderPhotoContent: function(idx) {
      renderPhotoInformation(+idx);
      getCommentsFor(idx);

    },

    bind: function() {
      this.$el.find("a.prev").on("click", $.proxy(this.prevSlide, this));
      this.$el.find("a.next").on("click", $.proxy(this.nextSlide, this));
    },

    init: function() {
      this.bind();
    }
  }



  $.ajax({
    url: "/photos",
    success: function(json) {
      photos = json;
      console.dir(photos);
      renderPhotos();
      renderPhotoInformation(photos[0].id);
      slideshow.init();
      getCommentsFor(photos[0].id);

      
     
    }
  });

  $("section > header").on("click", ".actions a", function(e) {
    e.preventDefault();
    var $e = $(e.target);
    $.ajax({
      url: $e.attr("href"),
      type: "post",
      data: "photo_id=" + $e.attr("data-id"),
      success: function(json) {
        $e.text(function(i,txt) {
          return txt.replace(/\d+/, json.total);
        });
      }
    });

  });

  $("form").on("submit", function(e) {
    e.preventDefault();
    var $f = $(this);

    $.ajax({
      url: $f.attr("action"),
      type: $f.attr("method"),
      data: $f.serialize(),
      success: function(json) {
        console.log($f.serialize());
        $("#comments ul ").append(templates.comment(json));
      }
    })
  })

  function renderPhotos() {
    console.log(photos);
    $("#slides").html(templates.photos({ photos: photos }));
    
  }

  function renderPhotoInformation(idx) {
    var photo = photos.filter(function(item) {
      return item.id === idx;
    })[0];
    console.log(photo);
    $("section > header").html(templates.photo_information(photo));
  }

  function getCommentsFor(idx) {
    $.ajax({
      url: "/comments",
      data: "photo_id=" + idx,
      success: function(comment_json) {
        $("#comments ul").html(templates.comments({comments: comment_json }));
      },
      

    });
  }
});