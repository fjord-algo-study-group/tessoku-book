q = gets.to_i
q.times do
  x =gets.to_i
  ans = 'Yes'
  (2..Integer.sqrt(x)).each do |i|
    if x % i == 0
      ans = 'No'
      break
    end
  end
  puts ans
end
