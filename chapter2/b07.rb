t = gets.to_i
n = gets.to_i
lr = n.times.map { gets.split.map(&:to_i) }

diff = Array.new(t+1){0}
lr.each {|l,r|
  diff[l] += 1
  diff[r] -= 1
}

ans = 0
t.times {|i|
  puts ans += diff[i]
}

__END__
10
7
0 3
2 4
1 3
0 3
5 6
5 6
5 6
