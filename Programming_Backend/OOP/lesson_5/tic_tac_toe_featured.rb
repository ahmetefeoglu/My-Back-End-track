require 'pry'

class Board
  attr_accessor :human_score, :computer_score
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
    @human_score = 0
    @computer_score = 0
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select {|key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won_game?
    human_score == 5 || computer_score == 5
  end

  def someone_won?
     if winning_marker == 'X'
      self.human_score += 1
      return true
    elsif winning_marker == 'O'
      self.computer_score += 1
      return true
    else
      return false
    end
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end



  def reset
    (1..9).each {|key| @squares[key] = Square.new}
  end

  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  


end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end



class Player
  attr_accessor :marker

  def initialize(marker)
    @marker = marker
  end
end


class Human < Player
  attr_accessor :name
   
  def choose_name
    
    puts "What's your name?"
    answer = ''
    loop do
      answer = gets.chomp
      break  unless  answer.empty?
      puts "Please write something"
    end
    self.name = answer 
  end


  


end

class Computer < Player
  attr_accessor :name

  def choose_name
    self.name = ['HAl', 'R2D2', 'Terminator', 'RoboCup'].sample
  end

end




class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = COMPUTER_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end


  def play
    clear
    
    display_welcome_message
    human.choose_name
    computer.choose_name


    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        display_result
        clear_screen_and_display_board
        
      end

      display_result
      break if board.someone_won_game?
      
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!   "
    puts ""
  end

  


  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "#{human.name} is #{human.marker}. #{computer.name} is a #{computer.marker}. Your score is #{board.human_score} ,comptuer score is #{board.computer_score}"
    puts ""
    board.draw
    puts ""
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker

  end

  def current_player_moves
    if @current_marker == HUMAN_MARKER
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#you  won!"
      puts "You are #{board.human_score} while computer  is #{board.computer_score}"
    when computer.marker
      puts "Computer won!"
      puts "You are #{board.human_score} while computer is #{board.computer_score}"

    else
      puts "It's a tie!"
      puts "Youur  score is  #{board.human_score} while computer is #{board.computer_score}"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  
end

game = TTTGame.new
game.play