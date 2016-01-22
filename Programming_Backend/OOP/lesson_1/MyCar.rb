
module Can_be_used_for_vacation
  def vacation_car
    puts "Yep you can use me in vacation"
  end
end

class Vehicle

  @@number_of_vehicles = 0

  def self.number_of_vehicles

    puts("this program created #{@@number_of_vehicles} vehicles")
  def speed_up(number)
    @speed += number
  end

  def brake(number)
    @speed -= number
  end

  def shut_off
    @speed = 0
  end
  def self.gas_mileage(litres , km)
    puts "Your #{@model} needs #{litres} to drive #{km} kilometres"
  end
end


class MyCar < Vehicle
  include Can_be_used_for_vacation
  attr_accessor :color
  attr_reader :year
  NUMBER_OF_DOORS = 4

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  


  

  def current_speed
    puts("Your current spead is #{@speed}")
  end

  def spray_paint(color)
    self.color = color
    puts("Your new color #{color} paint job looks great")
  end

  def to_s
    puts(" Your car's color is #{color} and is made in #{year}")
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end



car = MyCar.new('1968','Brown', 'Mustang')
MyCar.gas_mileage('30' , '100')
car.speed_up(20)
car.vacation_car
