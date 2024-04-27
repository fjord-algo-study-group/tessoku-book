h,w = gets.split.map(&:to_i)
m = Array.new(h){ gets.split.map(&:to_i)}
q = gets.to_i

s = Array.new(h+1){[0] * (w+1)}

h.times do |i|
  w.times do |j|
    s[i + 1][j + 1] = s[i + 1][j] + m[i][j]
  end
end

w.times do |j|
  h.times do |i|
    s[i + 1][j + 1] = s[i][j + 1] + s[i + 1][j + 1]
  end
end

q.times do
  a,b,c,d = gets.split.map(&:to_i)

  puts s[c][d] - s[a-1][d] - s[c][b-1] + s[a-1][b-1]
end

__END__
m = [0] * (w + 1) + Array.new(h){[0] + gets.split.map(&:to_i)}

m.map! { |row| i = 0; row.map! { |cell| i += cell } } # L7~11 横方向の累積和
m = m.transpose.map { |col| i = 0; col.map { |cell| i += cell } }.transpose # L13~17 縦方向の累積和


# 1次元の累積和
i = 0
s = [0] + m.map{ i += _1 }
