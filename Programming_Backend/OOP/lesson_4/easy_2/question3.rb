module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

#you write class.ancestors and it tells you 
