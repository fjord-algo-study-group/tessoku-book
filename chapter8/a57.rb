n, q = gets.split.map(&:to_i)
as = gets.split.map(&:to_i)
ques = q.times.map { gets.split.map(&:to_i) }

dp = Array.new(30) { Array.new(n+1, 0) }
dp[0] = [0] + as
(1..29).each do |r|
  (1..n).each do |i|
    dp[r][i] = dp[r-1][dp[r-1][i]]
  end
end

ques.each do |x, y|
  c = x
  29.downto(0) do |i|
    c = dp[i][c] if y[i] == 1
  end
  puts c
end

__END__
xjにいる時、穴yjにいる
a1 a2 a3 a4 a5 a6 a7
2  4  1  7  6  5  3

x = 1, y = 5 の時

1日後 a1 = 2 → a2へ
2日後 a2 = 4 → a4へ
3日後 a4 = 7 → a7へ
4日後 a7 = 3 → a3へ
5日後 a3 = 1


最初の添え字は 2^0日後, 2^1日後, 2^2日後 ... 2^4日後 ... 2^29日後
dp[0][i]
dp[1]


13日後は  13.to_s(2)
=> "1101"
# [0, 2, 4, 1, 7, 6, 5, 3]
(1..n).each { |i| dp[0][i] = as[i-1] }

13.to_s(2) = "1101"

irb(main):005> 13[0]
=> 1
irb(main):006> 13[1]
=> 0
irb(main):007> 13[2]
=> 1
irb(main):008> 13[3]
=> 1
