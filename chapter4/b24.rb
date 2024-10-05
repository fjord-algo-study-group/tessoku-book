n = gets.to_i
arr = n.times.map { gets.split.map(&:to_i) }.sort_by { [_1, -_2] }.map { _1[1] }
n = arr.size

dp = Array.new(n, 0)
len = 0
l = []

n.times do |i|
  pos = l.bsearch_index { |x| x >= arr[i] } || l.size
  dp[i] = pos

  if dp[i] >= len
    l << arr[i]
    len += 1
  else
    l[dp[i]] = arr[i]
  end
end

puts len
