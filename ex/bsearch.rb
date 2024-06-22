n, w = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

ans = 0
(1 << n).times do |bit|
  s = 0
  n.times do |i|
    s += a[i] if bit & (1 << i) != 0
  end
  ans += 1 if s == w
end

puts ans

__END__
# repeated_permutation版
n, w = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

def judge(pro, w, a)
  s = 0
  pro.each_with_index do |v, i|
    s += a[i] if v
  end
  s == w ? 1 : 0
end

ans = 0
[true, false].repeated_permutation(n).each do |pro|
  ans += judge(pro, w, a)
end

puts ans
