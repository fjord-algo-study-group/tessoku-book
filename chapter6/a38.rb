d, n = gets.split.map(&:to_i)
arr = n.times.map { gets.split.map(&:to_i) }
max = 24
ds = Array.new(d, 24)
arr.each do |l,r,h|
  (l..r).each do |i|
    ds[i-1] = [ds[i-1], h].min
  end
end
puts ds.sum

# ds = Array.new(d) { [24] }
# arr.each do |l,r,h|
#   (l..r).each do |i|
#     ds[i-1] << h
#   end
# end
# puts ds.sum(&:min)

# puts (1..d).sum { |i|
#   arr.map { |j,k,l| (j..k).include?(i) ? l : max }.min || max
# }
