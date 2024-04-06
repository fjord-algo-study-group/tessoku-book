n,k = gets.split.map(&:to_i)

count = 0
(1..n).each do |red|
  (1..n).each do |blue|
    white = k - red - blue
    if white <= 0 || white > n
      next
    else
      count += 1
    end
  end
end

puts count
