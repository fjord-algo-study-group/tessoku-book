n = gets.to_i
arr = gets.split.map(&:to_i)
# puts arr.tally.values.sum { |v| v*(v-1)*(v-2) / 6 }
puts arr.tally.values.sum { |v| Array.new(v).combination(3).size }
