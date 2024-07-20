n,s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

dp = Array.new(n+1){Array.new(20010)}

dp[0][0] = true

(1..n).each do |i|
  10002.times do |j|
    dp[i][j] = true if dp[i-1][j]
    unless j - a[i-1] < 0
      dp[i][j] = true if dp[i-1][j-a[i-1]]
    end
  end
end

if dp[n][s].nil?
  puts(-1)
  exit
end

j = s
ans = []
(1..n).reverse_each do |i|
  #一個上がtrueなら選んでない
  next if dp[i-1][j]

  j-= a[i-1]
  #ansに iを入れる
  ans << i
end

puts ans.length
puts ans.reverse.join(' ')
