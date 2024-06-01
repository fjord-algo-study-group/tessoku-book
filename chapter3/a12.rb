n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
l = 1
r = 10**9

while r > l
  mid = (l + r) / 2
  if k <= a.sum { |i| mid / i }
    r = mid
  else
    l = mid + 1
  end
end
puts l
