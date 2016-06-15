
function Deck() { 
  this.createDeck =  function() {
    var new_deck = [];
    var cards =  ["2 ","3 ","4 ","5 ","6 ", "7 ", "8 ", "9 ", "10 ", "jack", "queen", "king", "ace"];
    var types =  ["heart ", "clubs ", "diamond ", "spades "];
    types.forEach(function(suit) {
      cards.forEach(function(face) {  
        new_deck.push([suit,face]);
      });
    });

    return new_deck;
  };   
}


function Game() {
  var player = new Player();
  var computer = new Computer();

  this.shuffleDeck = function(deck) {
    var currentIndex = deck.length, temporaryValue, randomIndex;

      // While there remain elements to shuffle...
      while (0 !== currentIndex) {

        // Pick a remaining element...
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;

        // And swap it with the current element.
        temporaryValue = deck[currentIndex];
        deck[currentIndex] = deck[randomIndex];
        deck[randomIndex] = temporaryValue;
      }

    return deck;
  },

  this.dealCards = function(deck) {
    player.cards = deck.slice(0,2);
    computer.cards = deck.slice(2,4);
  }

  this.showHand = function() {
    console.log(computer.cards[1]);
    console.log(player.cards);
  }

  this.compareCards = function() {

    if (player.total() > computer.total()) {
      console.log("Player wins");
    }

    else if (computer.total() > player.total()) {
      console.log("Computer wins!!1");
      
    }

    else {
      console.log("It's a tie!!!");
      
    }
  }

  this.startGame = function() {
    while(true) {
      var deck_obj = new Deck();
      var new_deck = deck_obj.createDeck();
      this.shuffleDeck(new_deck);
      this.dealCards(new_deck);
      this.showHand();
      player.move(new_deck);

      if (player.checkIfBusted()) {
        console.log("Player is busted. Computer wins!!!");
        break;
      }
      
      computer.move(new_deck);
      if(computer.checkIfBusted()) {
        console.log("Computer is busted. Player wins!!!"); 
        break;
      }

      this.compareCards();

      var answer = prompt("Would you like to play again?");

      if (answer === "yes") {
        continue;
      }

      else {
        break;
      }
    }



  }
}


// Look carefully they have the same methods. 


function Player() {
  this.cards = [];
  

  this.addCard = function(deck) {
    this.cards.push(deck.pop());
  },

  this.move = function(deck) {
    while (true) {
      var choice = prompt("You have " + this.cards +" Would you hit or stay?");

      if (choice === "hit") {
        console.log("You have chosen to hit!!!");
        this.addCard(deck);
      }

      else if (choice === "stay") {
        break;
      }
      else {
        break;
      }
    }

  }
    

  this.hasAce = function() {
    this.cards.forEach(function(card) {
      if (card[1] === "ace") {
        return true;
      }

    });
    return false;
  },

  this.total = function() {
    var total = 0;
    var high_cards = ["ace","queen","king", "jack"];
    
   

      
    this.cards.forEach(function(card) {
      
      if (Number.isInteger(parseInt(card[1]))) {
        total +=  +card[1];
        
      }

      else if (high_cards.includes(card[1])) {
        total += 10;

      }
    });

    if (total > 21 && this.hasAce()) {
      total -= 9;
    }

    return total;

  }

  this.checkIfBusted = function() {
    return (this.total() > 21);

  }

  
}


function Computer() {
  this.cards = [];
  

  this.addCard = function(deck) {
    this.cards.push(deck.pop());
  }

  this.hasAce = function() {
    this.cards.forEach(function(card) {
        if (card[1] === "ace") {
          return true;
        }
    });
    return false;
  }

  this.total = function() {
    var total = 0;
    
    
    var high_cards = ["ace","queen","king", "jack"];
    
      

    this.cards.forEach(function(card) {   
      if (Number.isInteger(parseInt(card[1]))) {
        total +=  +card[1];
      }

      else if (high_cards.includes(card[1])) {
        total += 10;
      }
    });

    if (total > 21 && this.hasAce()) {
      total -= 9;
    }
    return total;
  }

  this.move = function(deck) {
    while (true) {
      var total = this.total();
      var choice = "stay";
      
      console.log(total);

      if (total < 17) {
        this.addCard(deck);
        choice = "hit";
        console.log("Computer hit!!!");
      }

      else {
        console.log("computer stays");
        break;

      }
    }
    return choice;    
  }

  this.checkIfBusted = function() {
    return (this.total() > 21);

  }
}


var gamee = new Game();

gamee.startGame();




















