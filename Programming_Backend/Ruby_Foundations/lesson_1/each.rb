require 'pry'
def each(array)
  counter = 0
  while counter < array.size
    yield(array[counter])
    counter +=1
  end

  array
end


each([1,2,3]) do |num|
  puts num
  binding.pry
end

    
 
