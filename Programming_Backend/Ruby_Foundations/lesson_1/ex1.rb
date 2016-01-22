

def compare(str)
  puts "Before #{str}"
  after = yield(str)
  puts "After #{after}"
end

compare("hello") { |word| word.upcase}

