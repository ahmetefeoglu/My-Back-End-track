munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" } 
}
count_age=0
 munsters.each do |name, details|
  
  if details["gender"]=="male"
    count_age += details["age"]
  end
end 
p(count_age)
