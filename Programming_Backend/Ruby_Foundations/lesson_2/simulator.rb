require 'pry'
class Robot
  attr_accessor :bearing, :x, :y

  def initialize
    @bearing = nil
    @x = 0
    @y = 0
    
    
  end



  def orient(direction)
    raise ArgumentError if !([:west, :east, :north, :south].include?(direction))
    self.bearing = direction
  end

  def turn_right
    case bearing
    when :north
      self.bearing = :east
    when :east
      self.bearing = :south
    when :south 
      self.bearing = :west
    when :west
      self.bearing = :north
    end
  end

  def turn_left
    case bearing
    when :north
      self.bearing = :west
    when :west
      self.bearing = :south
    when :south
      self.bearing = :east
    when :east
      self.bearing = :north
    end
  end

  def coordinates
    [x,y]
  end

  def at(x,y)
    self.x = x
    self.y = y
  end

  def advance
    case bearing
    when :north
      self.y += 1
    when :south
      self.y -= 1
    when :west
      self.x -= 1
    when :east
      self.x += 1
    end
  end
end


class Simulator
  attr_accessor :moves, :robot
 

  def initialize
  @moves = []
  @robot = Robot.new
  end

  def instructions(str)
    str.each_char do |char|
      case char
      when 'R'
        self.moves << :turn_right
      when 'L'
        self.moves << :turn_left
      when 'A'
        self.moves << :advance
      end
    end
    moves
  end

  def place(obj, coordinates = {'x' => 0, 'y' => 0, 'direction' => nil} )
    
    obj.at(coordinates[:x],coordinates[:y])
    obj.orient(coordinates[:direction])  
  end

  def evaluate(robot, str)
    instructions(str)
    moves.each do |symbol|
      case symbol
      when :turn_right
        robot.turn_right
      when :turn_left
        robot.turn_left
      when :advance
        robot.advance
      end
    end
  end


end

sim = Simulator.new
robot1 = Robot.new
robot2 = Robot.new
robot3 = Robot.new
sim.place(robot1,x: 0, y: 0, direction: :north)
sim.place(robot2, x: 2, y: -7, direction: :east)
sim.place(robot3,x: 8, y: 4, direction: :south)

robot1.at(2,2)
p robot1.x
p robot1.y
p robot1.coordinates



     
    



   














  