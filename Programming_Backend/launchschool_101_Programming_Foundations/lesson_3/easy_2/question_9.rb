flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |x|
  x[0,3 ]
end
p(flintstones)