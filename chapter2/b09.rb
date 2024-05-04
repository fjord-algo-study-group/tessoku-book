n = gets.to_i

s = Array.new(1505){Array.new(1505,0)}

n.times do
  a,b,c,d = gets.split.map(&:to_i)
  s[a][b] +=1
  s[c][d] +=1
  s[c][b] -=1
  s[a][d] -=1
end

2.times {
  s = s.map {|ary|
    i = 0
    ary.map { i += _1 }
  }.transpose
}

puts s.flatten.sum{|cell| cell == 0 ? 0 : 1}
