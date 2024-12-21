n, a, b = gets.split.map(&:to_i)
ary = Array.new(n + 1, false)

(n + 1).times do |i|
  if i >= a  #a個取れるか？
    unless ary[i - a]
      ary[i] = true
      next
    end
  end
  if i >= b # b個取れるか？
    unless ary[i - b]
      ary[i] = true
    end
  end
end

puts ary[n] ? "First" : "Second"
