class Move
  VALUES = ['rock', 'paper', 'scissors']
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
     (rock? && other_move.scissors?) ||
     (paper? && other_move.rock?) ||
     (scissors? && other_move.paper?)
       
  end

    
  

  def <(other_move)
    
    (rock? && other_move.paper?) ||
    (paper? && other_move.scissors?) ||
    (scissors? && other_move.rock?) 
    
  end
      
     
  

  def to_s
    @value 
  end


end



class Player
  attr_accessor :move, :name
  def initialize
    
    @move = nil
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do 
      puts "Please choose a name"
      n = gets.chomp
      break unless n.empty?
    end
    self.name = n
  end

  def choose
    puts "Please choose between rock,paper and scissors"
    choice = ''
    loop do 
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Your choice was invalid please try again!!!!"
      end
    self.move = Move.new(choice)
  end
end


class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end


end



class RPSGame
  attr_accessor :human, :computer
  def initialize
    #we initialize 2 player objects in this class to access them 
    @computer = Computer.new
    @human = Human.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors"
  end

  def display_goodbye_message
    puts "Thanks for palying the game cya!!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    
    if human.move > computer.move
      puts "#{human.name } won"

    elsif human.move < computer.move
      puts "#{computer.name} won"

    else
      puts "it's   a tie"
    end


  end

  def play_again?
    puts "Want to play again (y or n)"
    answer = ''
    loop do 
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
      puts "Sorrry invalid input try again!!!"
    end

    return true if answer == 'y'
    return false
  end

  def play
    #ana plan
    loop do 
      display_welcome_message
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
