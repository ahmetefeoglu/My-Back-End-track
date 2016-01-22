class Team
  attr_accessor :name , :members
  def initialize(name)
    @name = name
    @members = []
  end

  def <<(person)
    members.push(person)
  end
end

cowboys = 
