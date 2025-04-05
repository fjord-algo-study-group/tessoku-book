n, c = gets.chomp.split
a = gets.chomp.chars

convert = {
  'W' => 0,
  'B' => 1,
  'R' => 2,
}

puts (a.sum { convert[_1] } % 3) == convert[c] ? 'Yes' : 'No'

__END__
WBBR ← 2つを選ぶ順序は特に関係ないことに気づく

各色は以下の数値で表す
W 0
B 1
R 2

変換は2数の和に mod 3
0 + 0 = 0 mod 3 → 0
1 + 1 = 2 mod 3 → 2
2 + 2 = 4 mod 3 → 1
0 + 1 = 1 mod 3 → 1
0 + 2 = 2 mod 3 → 2
1 + 2 = 3 mod 3 → 0

各色の和にmod 3 をとった結果が C となれば良い
