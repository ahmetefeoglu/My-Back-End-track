




function Board() {
  
  this.squares = ["","","b","","","","","",""];
  this.squares_empty_indexes = [];

  this.findEmptySquares = function() {
    for (i = 0;length = this.squares.length, i < length; i++) {
      if (this.squares[i] === "") {
        this.squares_empty_indexes.push(i);
      }    
    }
    return this.squares_empty_indexes;
  }

  this.board  = "     |     |     "  + '\n' + 
                " " + this.squares[0] + "   |"  + this.squares[1] + "     | " + this.squares[2] + " " + '\n' + 
                "     |     |     "  + '\n' + 
                "-----+-----+------ "  + '\n' +
                "     |     |     "  + '\n' + 
                " " + this.squares[3] + "   |"  + this.squares[4] + "     | " + this.squares[5] + " " + '\n' + 
                "     |     |     "  + '\n' + 
                "-----+-----+------ "  + '\n' +
                "     |     |     "  + '\n' + 
                " " + this.squares[6] + "   |"  + this.squares[7] + "     | " + this.squares[8] + " " + '\n' + 
                "     |     |     "  + '\n' + 
                "-----+-----+------ "  + '\n' ;
               
  this.show = function() {
    console.log(this.board);
  }
}

function Computer() {
  this.marker = "O"
  this.move = function(empty_squares,squares) {
    var length = empty_squares.length;
    var rand = Math.floor((Math.random()* length) + 1);
    squares[rand] = this.marker;
  }
}

function Player() {
  this.marker = "X";
  this.move = function(empty_squares, squares) {
    while(true) {
      var choice = +prompt("PLease select a square from these: " + empty_squares.toString());
      if (empty_squares.includes(choice)) {
        squares[choice] = this.marker;
        break;
      }
    }
  }
}

function Game() {
  this.start = function() {
    var board = new Board();
    var computer = new Computer();
    var player = new Player();
    board.findEmptySquares();
    computer.move(board.squares_empty_indexes,board.squares);
    board.show();
    player.move(board.squares_empty_indexes, board.squares);
    console.log(board.squares);
    board.show();
  }
}


var game = new Game();

game.start();




  
  
  