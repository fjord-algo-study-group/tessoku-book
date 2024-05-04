h, w, n = gets.split.map(&:to_i)
weather = n.times.map { gets.split.map(&:to_i).map(&:pred) }
s = Array.new(h+1){ Array.new(w+1, 0) }

# 累積和を取るための増減表 O(N)
weather.each {|a, b, c, d|
  s[a][b] += 1
  s[c+1][d+1] += 1
  s[a][d+1] -= 1
  s[c+1][b] -= 1
}

# 累積和をとる O(HW)
2.times {
  s = s.map {|ary|
    i = 0
    ary.map { i += _1 }
  }.transpose
}
puts s[..-2].map{ _1[..-2].join(' ') }


__END__
ary = [1, 0, 0, -1, 0, 0]
 　　↓
1 1 1 0 0 0

i = 0
ary.map { i += _1 }
