 # ask for 2 numbers 
  #get 2 inputs:a and b 

 # ask for  a type of operation

 # if operation is equal to one of four "division"
 #, "substraction" "multiplication" , "addition" peform the types

  #else 
   # write one of these four 

  #  puts the results

  def prompt(message)
    Kernel.puts("=>  #{message}")

  end
  def valid_number?(number)
    number.to_i !=0
  end

  def operation_to_message(op)
    case op 
    when '1'
      'Adding'
    when '2'
      'Substracting'
    when '3'
      'Multiplying'
    when '4'
      'Dividing'

    end
  end
  


  

  
  prompt("Welcome to calculator. Enter your name")
  name=''
   loop do 
    name=Kernel.gets().chomp()
    if name.empty?()
      prompt("Make sure to use a valid name")
    else 
      break
    end
  end

  prompt("Hi #{name}")

  loop do # main loop
  num1=''
  loop do 
  prompt("What's the first number?")
  num1=Kernel.gets().chomp()
  if valid_number?(num1)
    break
  else 
    prompt("Enter again that was not valid !!!!")
  end
end

  


  num2=''
  loop do 
  prompt("What's the second number?")

  num2=Kernel.gets().chomp()
  if valid_number?(num2)
    break
  else 
    prompt("Enter again that was not valid !!!!")
  end
end


  operator=''
  prompt("What operation would you like to use 1)add  2)substract 3)multiply 4)division")
  loop do 
  operator=Kernel.gets().chomp()
  if %w(1 2 3 4).include?(operator)
    break
  else 
    prompt(" Must choose 1,2,3,4")
  end
end




  
     prompt("  #{operation_to_message(operator)} two numbers ")
     result=case operator
           when '1'
            num1.to_i() + num2.to_i()
          when  '2'
            num1.to_i() - num2.to_i()
          when  '3'
            num1.to_i() * num2.to_i()
          when '4'
            num1.to_f() / num2.to_f()
          end








  
  
  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation(Y to yes)")
  answer=Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end








  
    
  
