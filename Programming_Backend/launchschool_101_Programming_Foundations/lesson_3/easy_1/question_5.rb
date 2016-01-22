arr=(10 .. 100).to_a
p(arr)
if arr.include?(42)
  puts('Yep it contains')
else
  puts("Nope!!!")
end