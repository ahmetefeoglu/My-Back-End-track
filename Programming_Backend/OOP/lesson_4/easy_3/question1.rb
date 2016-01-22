class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


hello = Hello.new 
hello.hi #"Hello"

hello2 = Hello.new
hello.bye #error method not found

hello3 = Hello.new
hello3.greet #argument error

hello4 = Hello.new
hello4.greet("what's up") #what' up

hello5 = Hello.new
Hello.hi