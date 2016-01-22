class Television
  def self.manufacturer
    puts "manufacturee"
  end 

  def model
     puts "modelllll"
  end
end


tv = Television.new
#tv.manufacturer #udnefined method for This object
tv.model #works modellll

Television.manufacturer #works
Television.model #undefined method model 
