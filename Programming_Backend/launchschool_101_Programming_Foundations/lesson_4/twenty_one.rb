
def prompt(msg)
  puts " => #{msg} "
end

def initialising_player( deck)
  player = deck.sample(2)
  return player
end

def initialising_dealer( deck)
  dealer = deck.sample(2)
  return dealer
end

def hit(cards, deck)
  cards.push(deck.sample)
end

def total(cards) # sum of the cards
  values = cards.map { |card| card[1] }
  sum = 0
  
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select{|value| value == 'A'}.count.times do
    if sum > 21
      sum -= 10
    end

     
  end
  sum
end

def detect_result?(dealer_cards, player__cards)
  player_total = total(player__cards)
  dealer_total = total(dealer_cards)
  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_results(dealer_cards, player__cards)
  result = detect_result?(dealer_cards, player__cards)
  case result
  when :player_busted
    puts("You busted!!! Dealer wins")
  when :dealer_busted
    puts("Dealer busted.You won!!!")
  when :player
    puts("Player wins!!!")
  when :dealer 
    puts("Dealer wins!!!")
  end
end

def busted?(cards)
  if total(cards) > 21
    return true
  else
    return false
  end
end

def play_again?()
  prompt("Do you want to play again (y or n) ?")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end


deck = [['H','2'], ['H','3'], ['H','4'], ['H','5'], ['H','6'], ['H','7'], ['H','8'], ['H','9'], ['H','10'], 
       ['H', 'jack'], ['H' ,'queen'], ['H' ,'king'], ['H' ,'ace'],['D','2'], ['D','3'], ['D' ,'4'], ['D','5'], 
       ['D','6'], ['D','7'], ['D','8'], ['D','9'], ['D','10'], ['D', 'jack'], ['D','queen'], ['D', 'king'], 
       ['D','ace'],['C','2'], ['C','3'], ['C','4'], ['C','5'], ['C','6'], ['C','7'], ['C','8'], ['C', '9'],
       ['C','10'], ['C', 'jack'], ['C', 'queen'], ['C', 'king'], ['S','2'], ['S','3'], ['S' ,'4'], ['S','5'], 
       [  'S' ,'6'], ['S','7'], ['S','8'], ['S','9'], ['S','10'] , ['S', 'jack'], ['S','queen'], ['S','king'], ['S','ace']]

loop do # main loop
  player_cards = initialising_player(deck)
  dealer_cards = initialising_dealer(deck)

  prompt("Dealer has #{dealer_cards[0]} and ?")
  prompt("You have #{player_cards[0]} and #{player_cards[1]}")

loop do 
  prompt("Will you 'hit' or 'stay'?")
  answer = gets.chomp
  if answer == 'stay' || busted?(player_cards) # busted methodunu yazmalısın
    break
  else
    hit(player_cards, deck)
    prompt("your cards are now #{player_cards}")
  end
end

if busted?(player_cards)
  display_results(dealer_cards, player_cards)
  play_again? ? next : break
  
else 
  puts("You chose to stay at #{total(player_cards)}")
end

loop do #dealer turn
  break if total(dealer_cards) >= 17 || busted?(dealer_cards)
  hit(dealer_cards, deck)
  p(dealer_cards)
end

if busted?(dealer_cards)
  display_results(dealer_cards, player_cards)
  play_again? ? next : break
  

else 
  prompt("Dealer stays at #{total(dealer_cards)}")
  display_results(dealer_cards, player_cards)
end

break unless play_again?
end
















       
       
       
       

