require 'pry'
class Robot
  attr_accessor :coordinates, :bearing
  attr_reader :orientation
  def initialize
    @orientation = [:west, :north, :east, :south]
    @coordinates = [0,0] #array olacak
    @bearing = nil
  end


  def at(num1, num2)
    self.coordinates[0] =  num1
    self.coordinates[1] =  num2
  end

  def orient(direction)
    raise ArgumentError unless orientation.include?(direction)
    self.bearing = direction
  end

  def turn_right
    case bearing
    when :west
      self.bearing = :north
    when :north
      self.bearing = :east
    when :east
      self.bearing = :south
    when :south
      self.bearing = :west
    end
  end


  def turn_left
    case bearing
    when :west
      self.bearing = :south
    when :south
      self.bearing = :east
    when :east
      self.bearing = :north
    when :north
      self.bearing = :west
    end
  end

  def advance
    case bearing
    when :west
      coordinates[0] -= 1
    when :east
      coordinates[0] += 1
    when :north
      coordinates[1] += 1
    when :south
      coordinates[1] -= 1
    end
  end

end






class Simulator
  attr_accessor :commands, :robot

  def initialize
    @commands = []
    @robot = Robot.new
    
  end


  def instructions(string)
    string_arr = string.chars
    string_arr.each do |x|
      case x
      when 'R'
        self.commands << :turn_right
      when 'L'
        self.commands << :turn_left
      when 'A'
        self.commands << :advance
      end
    end
    self.commands
  end


  def place(obj, options = {} )
    x = options[:x]
    y = options[:y]
    obj = self.robot
    direct = options[:direction]
   
    obj.at(x,y)
    obj.orient(direct)
    
  end

  def evaluate(obj, instructon)
    obj = self.robot
   
    instructions(instructon)

    self.commands.each do |x|
      case x
      when :turn_right
        obj.turn_right
      when :turn_left
        obj.turn_left
      when :advance
        obj.advance
      end
    end
   
  end

    


end


sim = Simulator.new
sim.place(@robot, x: 0, y: 0, direction: :north)

sim.evaluate(@robot, 'RAR')
p sim.robot.coordinates

















  