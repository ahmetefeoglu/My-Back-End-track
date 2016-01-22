class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color 
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

#return in 10th line because even if we dont use it self.information will return that strings value anyway