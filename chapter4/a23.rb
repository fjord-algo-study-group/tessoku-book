n, m = gets.split.map(&:to_i)
a = Array.new(m) { gets.split.reverse.join.to_i(2) }
dp = Array.new(m+1) { Array.new(1<<n, 200) }
dp[0][0] = 0

m.times do |i|
  aa = a[i]
  (1<<n).times do |j|
    next if dp[i][j] == 200

    # 遷移
    # クーポン使わない
    dp[i+1][j] = [dp[i+1][j], dp[i][j]].min

    # クーポン使う
    dp[i+1][j|aa] = [dp[i+1][j|aa], dp[i][j]+1].min
  end
end

p dp[m][(1<<n)-1] == 200 ? -1 : dp[m][(1<<n)-1]

__END__
0 0 1 → 100(2進数) →4(10進数)
0 1 0 → 010  → 2
1 0 0 → 001  → 1
1 1 0 → 011  → 3

3 6 9 3
|   |   3
  | |   2
    | | 2
      | 1
