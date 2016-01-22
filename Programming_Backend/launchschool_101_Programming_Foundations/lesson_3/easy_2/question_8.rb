flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each_index  do |x|
  if flintstones[x].include?("Be")
    p(flintstones[x])
  end
end
