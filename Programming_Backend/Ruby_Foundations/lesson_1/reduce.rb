require 'pry'
def reduce(array, default = 0)
  counter = 0
  total = default
  while counter < array.size
    total += array[counter]  if yield(total, array[counter])
    counter += 1
  end
  total 
end


reduce([1,2,3,4,5], 10) { |acc, num| acc + num}

binding.pry

