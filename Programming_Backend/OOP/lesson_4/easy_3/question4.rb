class Cat
  attr_reader :type
  def initialize(type)
    @type = type
  end


  def to_s
  puts   "hi I 'm a #{type} cat"
  end
end

cat = Cat.new('tabbie')
cat.to_s