n = gets.to_i
a = gets.split.map(&:to_i)

puts a.inject(:^) == 0 ? "Second" : "First"
