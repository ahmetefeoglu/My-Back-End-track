$(function() {
  var products = [{
    name: "Banana",
    quantity: 14,
    price: 0.79
  },{
    name: "Apple",
    quantity: 3,
    price: 0.55
  }];

  var product_template = Handlebars.compile($("#template").html());

  var products_html = [];

  $("body").html(product_template({items: products}));

});