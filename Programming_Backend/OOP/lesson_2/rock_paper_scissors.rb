class Player
  attr_accessor :move, :name
  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name

  end

  def choose
    if human? 
      puts "Please choose between rock,paper and scissors"
      choice = ''
      loop do 
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Your choice was invalid please try again!!!!"
      end


      self.move = choice
    else

      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end


  def set_name
    if human?
      n = ''
      loop do 
        puts "Please choose a name"
        n = gets.chomp
        break unless n.empty?
      end
      self.name = n


    else
      self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
    end
  end
end



class RPSGame
  attr_accessor :human, :computer
  def initialize
    #we initialize 2 player objects in this class to access them 
    @computer = Player.new(:computer)
    @human = Player.new
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

    case human.move
    when 'rock' 
      puts "it's a tie" if computer.move == 'rock'
      puts "#{human.name} won" if computer.move == 'scissors'
      puts "#{computer.name} won" if computer.move == 'paper'
    when 'paper'
      puts "it's a tie" if computer.move == 'paper'
      puts "#{human.name} won" if computer.move == 'rock'
      puts "#{computer.name} won" if computer.move == 'scissors'
    when 'scissors'
       puts "it's a tie" if computer.move == 'scissors'
      puts "#{human.name} won" if computer.move == 'paper'
      puts "#{computer.name} won" if computer.move == 'rock'
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