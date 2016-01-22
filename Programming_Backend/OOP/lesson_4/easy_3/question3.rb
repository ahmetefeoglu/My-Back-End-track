class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name 
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
cat1 = AngryCat.new('7', 'fusfus')
cat2 = AngryCat.new('10', 'Rocky')
 puts cat1.age
puts cat1.name

puts cat2.age
puts cat2.name