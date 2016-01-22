require 'pry'

class Card
  attr_accessor :suit , :face
  SUITS = ['H', 'D', 'S', 'C']
  FACES = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end


  def ace?
    face == 'Ace'
  end

  def queen?
    face == 'Queen'
  end

  def king?
    face == 'King'
  end

  def jack?
    face == 'Jack'
  end
end

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        cards << Card.new(suit,face)
      end
    end
    cards.shuffle!
  end


  def deal_one
    cards.pop
  end

end


class Player
  attr_accessor :player_cards
  def initialize
    @player_cards = []
  end

  def add_one_card(card)
    player_cards << card
  end

  def busted?
    total > 21
  end



  def total
    total = 0
    player_cards.each do |cards|
      if cards.ace?
        total += 11
      elsif cards.king? || cards.queen? || cards.jack?
        total += 10
      else
        total += cards.face.to_i
      end
        
    end

    player_cards.select(&:ace?).count.times do
      break if total < 21
      total -= 10
    end
    total
  end




end


class Dealer
  attr_accessor :dealer_cards
  def initialize
    @dealer_cards = []

  end

  def add_one_card(card)
    dealer_cards << card
  end

  def busted?
    total > 21
  end



  def total
    total = 0
    dealer_cards.each do |cards|
      if cards.ace?
        total += 11
      elsif cards.king? || cards.queen? || cards.jack?
        total += 10
      else
        total += cards.face.to_i
      end
        
    end

    dealer_cards.select(&:ace?).count.times do
      break if total < 21
      total -= 10
    end
    total
  end


end









  


class Participant

end








class Game
  attr_accessor :player, :dealer, :deck
  def initialize 
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end




  def start
    display_welcome_message
    loop do 
      deal_cards
      puts " #{player.player_cards}"
      p dealer.dealer_cards[0]
    
    
      player_turn
      if player.busted? 
        break
      end
      dealer_turn
      if dealer.busted?
        break
      end
    end
    #show_result
    display_goodbye_message

  end

  def deal_cards
    2.times do 
      player.add_one_card(deck.deal_one)
      dealer.add_one_card(deck.deal_one)
    end
  end

  def player_turn
    
    loop do 
      answer = nil
      puts "Would you like to hit or stay (h or s)"
      loop do   
        answer = gets.chomp.downcase
        break if  ['h', 's'].include?(answer)
        puts "Please just write 'h' or 's'"
      end

      if answer == 's'
        puts "Player stays"
        break
      elsif player.busted?
        break
      else
        player.add_one_card(deck.deal_one)
        puts "You hit"
        p player.player_cards
        break if player.busted?
      end
    end
  end

      
      
    
  

  def dealer_turn
    loop do 
      if dealer.total >= 17 && !dealer.busted?
        puts "Dealer stays!!!"
        break
      elsif dealer.busted?
        break
      else
        puts "Dealer hits"
        dealer.add_one_card(deck.deal_one)
      end
    end
  end
        







    
      
  def show_busted
    if player.busted?
      puts "It looks like player just got busted. Dealer wins!!"
    elsif dealer.busted?
      puts "ıt looks like dealer just got busted.Player wins!"
    end
  end

  def compare_cards
  end



  def display_welcome_message
    puts "Welcome to the Twenty-one Game!!!"
  end

  def display_goodbye_message
    puts "Thanks for playing cya!!"
  end

end

Game.new.start

