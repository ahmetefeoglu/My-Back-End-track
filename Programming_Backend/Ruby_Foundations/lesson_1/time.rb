
def time(number)
  counter = 0
  while counter < number do 
    yield(counter)
    counter += 1
  end
end






time(5) do |num|
  puts num
end