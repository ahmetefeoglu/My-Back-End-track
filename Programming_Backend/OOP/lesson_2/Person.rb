class Person
  attr_accessor  :first_name, :second_name
  
  def initialize(fullname)
    parse_full_name(fullname)

    
  end

  def name
    "#{first_name} #{second_name}".strip
  end

  def name=(fullname)
    parse_full_name(fullname)
  end


  def compare_names(pers1,pers2)
    if pers1.first_name == pers2.first_name && pers1.second_name == pers2.second_name
      puts("They are the samee")
    else
      puts("They are not")
    end
  end

  def to_s
    name
  end

  private

  def parse_full_name(fullname)
    parts = fullname.split
    @first_name = parts.first
    @second_name = parts.size > 1 ? parts.last : ''
  end

  





end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
bob.compare_names(bob,rob)
puts("The person's name is #{bob}")