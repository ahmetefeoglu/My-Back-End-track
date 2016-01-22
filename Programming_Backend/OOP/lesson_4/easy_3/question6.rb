class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    #self.age += 1
    @age += 1
    puts "#{age}"
  end
end

cat = Cat.new('tabb')
cat.make_one_year_older