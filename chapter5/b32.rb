n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

ary = Array.new(n + 1, false)
(n + 1).times do |i|
  ary[i] = a.any? do |j|
    i >= j  && !ary[i - j]
  end
end

puts ary[n] ? "First" : "Second"