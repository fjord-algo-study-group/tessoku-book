N, Q = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
i = 0
s = [i] + A.map { i += _1 } # 計算量O(N)
Q.times { # 計算量O(Q) ← Q * 1 = Q
  l, r = gets.split.map(&:to_i)
  puts s[r] - s[l-1] # 計算量O(1)
}


__END__
# # 累積和の期待する値
# [0, 8, 14, 23, 24, 26, 27, 37, 137, 1137, 11137]

# # 累積和いろいろ
# # その2
# a = 0
# s = A.inject([]) { |result, i|
#   result << a += i
# }
# p s

# # その3
# arr = [0]
# N.times {|i|
#   arr << arr[-1] + A[i]
# }
# p arr
