class Cube
  def initialize(volume)
    @volume = volume
  end

  def get_volume
    @volume
  end
end

cub =  Cube.new(30)
puts cub.get_volume
