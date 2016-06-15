var inventory;


inventory = {
  last_id : 0,

  collection: [],

  
  writeDate: function() {
    var date = new Date();
    $("#date_order").text(date.toUTCString());

  },

  cacheTemplate: function() {
    
    var $i_temp = $("#inventory_item").remove();
    this.template = $i_temp.html();
   
  },
  add: function() {
    this.last_id++;
    
    var item = {
      id: this.last_id,
      name: "",
      stock_number: "", 
      quantity_number: 1
    };

    this.collection.push(item);

    return item;

  },

  newItem: function(e) {
    e.preventDefault();
    var item = this.add()
    var $item = $(this.template.replace(/ID/g, item.id));
    
    $("#inventory").append($item);

    

  },

  deleteItem: function(e) {
    e.preventDefault();
    
    
    var $item = this.findParent(e).remove();
    this.remove(this.findId($item));

    
    


  },

  remove: function(id) {
    
    console.log(typeof idx);
    this.collection = this.collection.filter(function(item) {
      console.log("yeah");
      return item.id !== id;
    });
    console.log(this.collection);

  },

  get: function(id) {
    var found_item;
    this.collection.forEach(function(item) {
      if (item.id === id) {
        found_item = item;
        return false;
      }


    })

    return found_item;
  }

  update: function($item) {
    var id = this.findId($item),
        $item = this.get(id);

  },

  findParent : function(e) {
    return  $(e.target).closest("tr");

  },

  findId: function($item) {
    return +$item.find("input[type = hidden]").val();


  },

  updateItem: function(e) {
    var $item = this.findParent(e);

    this.update($item);

    

  },

  bindEvents: function() {
    $("#add_item").on("click", $.proxy(this.newItem, this));
    
    $("#inventory").on("click", "a.delete", $.proxy(this.deleteItem, this));

    $("#inventory").on("blur", ":input", $.proxy(this.updateItem, this));

  },

  init: function() {
    this.writeDate();
    this.cacheTemplate();
    this.bindEvents();

  }
  


};



$($.proxy(inventory.init, inventory));



