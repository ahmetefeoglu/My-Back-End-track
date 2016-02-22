require 'pry'
class Triplet
  attr_reader :num1, :num2, :num3, :sum
  def initialize(num1, num2, num3)
    @num1 = num1
    @num2 = num2
    @num3 = num3
    @sum = num1 + num2 + num3
    
   
  end

  def pythagorean?
    num1**2 + num2**2 == num3**2
  end

  def product
    num1 * num2 * num3
  end

  

  





  def self.where(options = {})
    max = options[:max_factor]
    min = options[:min_factor]
    sum = options[:sum]
    binding.pry
    #max su an 10
    result = []
    p min

    if min == nil
      arr = (1 .. max).to_a
    else
      arr = (min .. max).to_a
    end

    arr.combination(3).to_a.each do  |a,b,c|
      if sum == nil
        if a**2 + b**2 == c**2 
          new_triplet = Triplet.new(a,b,c)
          result << new_triplet
        end
      elsif sum == a + b + c && a**2 + b**2 == c**2 
        new_triplet = Triplet.new(a,b,c)
        result << new_triplet
      end
    end


    p result
    result
  end
end

ex = Triplet.new(1,2,3)
Triplet.where(sum: 12, max_factor: 10)



