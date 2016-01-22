def prompt(message)
  Kernel.puts("=> #{message} ")
end

def valid_number?(number)
 if  number.to_i >0
  return true
end
end 

prompt("Welcome to the car loan calculator!!!")
 loop do #main loop



prompt("Please write the amont of money you borrowed")
loan_amount=''
loop do 
  loan_amount=gets().chomp().to_i
  if valid_number?(loan_amount)
    prompt("The money you borrowed is " + loan_amount.to_s)
    break
  else
    prompt("İnvalid number type again!!!!")
  end
end




 


 


prompt("Please write your  annual percentage rate like this if it is '%5' you write 1.05")
annual_percentage_rate=''
loop do
  annual_percentage_rate=gets().chomp().to_f
  if valid_number?(annual_percentage_rate)
    prompt("You chose an interest rate of " + annual_percentage_rate.to_s)
    break
  else
    prompt("İnvalid number!!!")
  end
end



prompt("Please write your car loan duration in years")
loan_duration_years=''
loop do 
  loan_duration_years=gets().chomp().to_i
  if valid_number?(loan_duration_years)
    prompt("You chose " + loan_duration_years.to_s + "years")
    break
  else
    prompt("İnvalidddd!!!")
  end
end





 


 

total_payment=loan_amount*(annual_percentage_rate**loan_duration_years)
prompt("Your total pay is " + total_payment.to_s)

loan_duration_month=loan_duration_years*12
prompt("Your loan duration as month is " + loan_duration_month.to_s)

monthly_payment=total_payment/12
monthly_percentage_rate=monthly_payment/(loan_amount/loan_duration_month)
prompt("Your monthly interest rate is " + monthly_percentage_rate.to_s)

prompt("Would you like to use it again? Type 'y' if you want")
answer=gets().chomp()
break unless answer.downcase().start_with?('y')

end




