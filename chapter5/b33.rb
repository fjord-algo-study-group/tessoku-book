n, h, w = gets.split.map(&:to_i)
puts n.times.flat_map { |n| gets.split.map { |nn| nn.to_i - 1} }.inject(:^) == 0 ? 'Second' : 'First'


__END__
2 8 4
6 4
7 1

5 3 で判定
ニム和 0
  後手勝ち

01011100
11111111 (and
-------------
