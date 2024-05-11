n = gets.to_i
a = gets.split.map(&:to_i)
d = gets.to_i

i = 0
sm_l = a.map { i = [i, _1].max }

i = 0
sm_r = a.reverse.map { i = [i, _1].max }.reverse

d.times do
  l, r = gets.split.map { _1.to_i - 1 }
  max_l = sm_l[l-1]
  max_r = sm_r[r+1]
  p [max_l, max_r].max
end


__END__
3 ~ 5
l: sm_l[1] 0..1 のなかで最大値を出す
r: sm_r[r+1]
[1, 2, 5, 5, 5, 5, 5]
[5, 5, 5, 5, 3, 3, 1]
