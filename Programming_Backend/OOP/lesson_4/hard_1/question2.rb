
module Moveable
  attr_accessor :speed , :heading
  attr_writer :fuel_efficiency , :fuel_capacity
  def range
    @fuel_capacity * @fuel_efficiency
  end
end






class WheeledVehicle
  include Moveable
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures along with
    super([20,20], 80, 8.0)
  end
end



class Catamaran
  include Moveable
  attr_accessor :propeller_count, :hull_count, 

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
    self.fuel_capacity = liters_of_fuel_capacity
    self.fuel_efficiency = km_traveled_per_liter
  end


end


class Motorboat
  include Moveable
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    self.fuel_capacity = liters_of_fuel_capacity
    self.fuel_efficiency = km_traveled_per_liter
    @num_propellers = 1
    @num_hulls = 1
  end
end


