$(function() {
  var canvas = document.querySelector("canvas");
  var ctx = canvas.getContext("2d");
  /*
  var colors = ["#000", "#003", "#006", "#009", "#00c", "#00f"];
  
  

  function draw() {
    colors.forEach(function(color, i) {
      ctx.fillStyle = color;
      ctx.fillRect(i*20, i*20, canvas.width -i*40, canvas.height- i*40);
        
    });
    colors.unshift(colors.pop());
  }
  */

  var x = canvas.width/3;
  var y = canvas.height/3;
  var radius = x;

  ctx.beginPath();
  ctx.arc(x,y, radius,0, 2* Math.PI);
  ctx.fill();
  ctx.closePath();

  var img_src = canvas.toDataURL("png");
  var img = document.createElement("img");

  img.src = img_src;
  document.body.appendChild(img);
});