module Walkable
  def walk
    puts "I am walking"
  end
end


module Swimmable
  def swim
    puts "I am swimming"
  end
end


module Climbable
  def climb
    puts "I am climbing"
  end
end

class Animal
  include Walkable

  def speak
    puts("I am an animal and I speak")
  end
end

fido = Animal.new
fido.walk
