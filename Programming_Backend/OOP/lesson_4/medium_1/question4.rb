class Greet
  def greet(msg)
    puts "#{msg}"
  end
end

class Hello < Greet
  def hi
    greet("hello")
  end
end

class Goodbye < Greet
  def bye
    greet("goodbye")
  end
end
