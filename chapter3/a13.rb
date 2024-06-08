n, k = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
ans = 0
r = 0
A.each_with_index { |a, l|
  while r < n - 1 && A[r+1] - a <= k
    r += 1
  end
  ans += r - l
}
puts ans
