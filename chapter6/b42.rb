n = gets.to_i
arr = n.times.map { gets.split.map(&:to_i) }

puts [1, -1].repeated_permutation(2).map { |sign1, sign2|
  arr.select { |a,b|  sign1 * a + sign2 * b > 0 }.sum { |a,b| sign1 * a + sign2 * b}
}.max

# res << arr.select { |a,b| a + b > 0 }.sum { |a,b| a + b}
# res << arr.select { |a,b| a - b > 0 }.sum { |a,b| a - b}
# res << arr.select { |a,b| -a + b > 0 }.sum { |a,b| -a + b}
# res << arr.select { |a,b| -a - b > 0 }.sum { |a,b| -a - b}
# puts res.max

__END__
A B
2 8 x
4 -5 o
5 -3 o
-4 1 x
-2 -3 o


|4 + 5 -2| + | -5 -3 -3 |
= sum { |a, b| a - b }
= transpose.map(&:sum).map(&:abs).sum

      表   裏
   i) 正 x 正　→ A と B を比べて 絶対値の大きい方が正なら採用
  ii) 正 x 負 → A と -B を比べて絶対値の大きい方が正なら採用
  iii) 負 x 正　→ -A と B を比べて
  iv) 負 x 負 → -A と -B を比べて
