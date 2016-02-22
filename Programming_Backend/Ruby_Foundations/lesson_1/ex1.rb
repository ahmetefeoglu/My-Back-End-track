

def compare(str)
  if block_given?
   after =  yield(str)
  end
  puts after

  str
end

compare("hi") { |word| word.upcase}