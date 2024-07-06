n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
dp = Array.new(n + 1, 0)
(n-1).times { |i|
  if i >= 1
    dp[i+2] = [dp[i+1] + a[i], dp[i] + b[i-1]].min
  else
    dp[i+2] = dp[i+1] + a[i]
  end
}
puts dp[n]

__END__
# upto版
2.upto(n) { |i|
  if i > 2
    dp[i] = [(dp[i-1] + a[i-2]), (dp[i-2] + b[i-3])].min
  else
    dp[i] = dp[i-1] + a[i-2]
  end
}

# if文いらない版
## upto
dp[2] = a[0]
3.upto(n) { |i|
    dp[i] = [(dp[i-1] + a[i-2]), (dp[i-2] + b[i-3])].min
}
## times
dp[2] = a[0]
(n-2).times { |i|
  dp[i+3] = [dp[i+2] + a[i+1], dp[i+1] + b[i]].min
}
