n, w = gets.split.map(&:to_i)
wv = Array.new(n) { gets.split.map(&:to_i) }

dp = Array.new(n+1) { Array.new(w+1, 0) }

(1..n).each do |i|
  wi, vi = wv[i-1]

  (w+1).times do |j|
    # 選ばなかった場合
    dp[i][j] = [dp[i][j], dp[i-1][j]].max
    # 選んだ場合
    dp[i][j] = [dp[i][j], dp[i-1][j-wi]+vi].max if j-wi >= 0
  end
end

p dp[n][w]

__END__
10 285
29 8000
43 11000
47 10000
51 13000
52 16000
66 14000
72 25000
79 18000
82 23000
86 27000

