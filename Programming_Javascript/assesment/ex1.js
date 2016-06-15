$(function() {
  console.log("hello");

  function computeDistance(point1,point2) {
    var distance_power_2 = Math.pow((point1.x-point2.x), 2) + Math.pow((point1.y-point2.y), 2);
    return Math.sqrt(distance_power_2);

  }

  var obj1 = {x:2, y:3};
  var obj2 = {x:4, y:6};

  console.log(computeDistance(obj1, obj2));
});