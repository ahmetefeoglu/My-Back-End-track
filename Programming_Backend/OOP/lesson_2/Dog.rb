class Dog
  def speak
    "Arf"
  end

  def swim
    "Swimming"
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end

end

class BullDog < Dog
  def swim
    "cant swim"
  end
end

class Cat <Dog
  def swim
    "cant swim"
  end

  def fetch
    ' cant fetch!'
  end
end



teddy = Dog.new
puts teddy.speak
puts teddy.swim
bull = BullDog.new
puts bull.swim
 p BullDog.ancestors