def joinor(arr)
  i=0
  new_arr = []
  arr.each do |num| 
    while i< arr.size
      new_arr.push(arr[num])
      i += 1
    end
  end
  p(new_arr)

end



a=[1,2,3,4,5,6,7]

joinor(a)