require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagnols

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts " => #{msg}"
end

def joinor(arr, delimiter, word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

  
# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "     |     |"
  puts "  #{brd[1]}  | #{brd[2]}   | #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{brd[4]}   | #{brd[5]}   | #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  | #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end




def player_places_piece(brd)
  square = ' '
  loop do 
    prompt("Choose a square #{joinor(empty_squares(brd), ',', 'or')}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
      prompt("Sorry that's not  a valid choice")
    end
    brd[square] = PLAYER_MARKER
  end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
   !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'  
    end
  end
  nil
end
score_player = 0
score_computer = 0
loop do 
  board = initialize_board
  display_board(board)

loop do 
  display_board(board)
  player_places_piece(board)
  break if someone_won?(board) || board_full?(board)
  computer_places_piece!(board)
  break if someone_won?(board) || board_full?(board)
end
display_board(board)

if someone_won?(board)
  prompt("#{detect_winner(board)} won this round!!! ")
else
  prompt("It's a tie!!!")
end

if detect_winner(board) == 'Player'
  score_player += 1
elsif detect_winner(board) == 'Computer'
  score_computer += 1
end

prompt("Play again y or n?")
answer=gets.chomp
break if  answer.downcase.start_with?('n') || (score_computer == 5 || score_player == 5)

end

prompt(" Computer is #{score_computer} , player is  #{score_player}")
prompt("Thanks for playing the game!!!")