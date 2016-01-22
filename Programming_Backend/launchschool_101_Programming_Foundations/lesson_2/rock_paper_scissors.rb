 VALID_CHOICES = ['rock', 'paper', 'scissors']

 def prompt(message)
   Kernel.puts("=> #{message}")

  
end

  def win?(first,second)
    if first=='rock' && second=='scissors' || (first=='paper' && second=='rock') || 
  (first=='scissors' && second=='paper')
  prompt("You won!!!")
end
end


 def display_results(player,computer)
  if win?(player,computer)

    prompt("You won!!!")
elsif
  win?(computer,player)

    prompt("Computer won!!!")

else 
  prompt("It's a tie")
end
end
loop do 
  choice =  ''
  loop do 
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  choice=gets().chomp()
  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not  a valid choice")
  end
end


computer_choice=VALID_CHOICES.sample()
prompt("You chose #{choice} , computer chose #{computer_choice}")

display_results(choice,computer_choice)

prompt("Do you want to play again?  Type 'y' if you want to!!")
answer=Kernel.gets().chomp()
break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing")





