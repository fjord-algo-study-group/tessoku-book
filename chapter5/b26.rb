n = gets.to_i
deleted = Array.new(n+1, false)
deleted[0..1] = true, true
(2..Integer.sqrt(n)).each do |i|
  next if deleted[i]
  j = i * 2
  while j <= n do
    deleted[j] = true
    j += i
  end
end
deleted.each_with_index { |n, i| puts i unless n  }
