module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

 carr = Car.new
 carr.go_fast

 truckk = Truck.new
 truckk.go_fast


# Because self refers to our object and ".class" shows that objects current class with interpolation we can put it in a string 