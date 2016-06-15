$(function() {
  var words = ["abacus", "symmetry","reasoning", "rational"];
  var rand_num = Math.floor(Math.random()* words.length);

  function Game() {
    this.chosen_word = words[rand_num].split("");
    this.incorrect_guess  = 0;
    this.arr_of_guess = [];
    this.correct_space = 0;

    this.showWordSpaces = function(word) {
      console.log(word);
      for(var i = 0;length = word.length, i < length; i++) {
        var $span = $("<span></span>");
        $("#spaces").append($span);
      }
     

    };


    this.processGuess = function(e) {
      if (e.which >= 97 && e.which <= 122) {
        var letter = String.fromCharCode(e.which);
        this.addToGuessArr(letter);
        this.guessMatchesWord(letter);
        this.renderGuess(letter);     
      }

    };

    this.addToGuessArr = function(letter) {
      this.arr_of_guess.push(letter);
    };

    this.renderGuess = function(letter) {
      if (this.arr_of_guess.includes(letter)) {
        var $span = $("<span></span>").text(letter);
        $("#guesses").append($span);

      }
    }

    this.wordIncludesLetter = function(letter) {
      return this.chosen_word.includes(letter);

    };

    this.modifyApples = function() {
      $("#apples").addClass("guess_" + this.incorrect_guess);
    };

    this.guessMatchesWord = function(letter) {
      var self = this;
      if (this.wordIncludesLetter(letter)) {
        this.chosen_word.forEach(function(l,i) {
          if (letter === l) {
            $("#spaces span").eq(i).text(letter);
            self.correct_space++;
          }
        });  
      }

      else {
        this.incorrect_guess++;
        console.log(this.incorrect_guess);
        this.modifyApples();

      }
      
    }
      
    this.bindEvent = function() {
      $(document).on("keypress", this.processGuess.bind(this));
    };


    this.start = function() {
      this.showWordSpaces(this.chosen_word);
      this.bindEvent();
    };



  }


  Game.prototype.num_of_guess = 6;

  var game = new Game();
  game.start();
});




