n = gets.to_i
m = Array.new(1501) { [0] * 1501 }
n.times { 
  x, y = gets.split.map(&:to_i)
  m[x][y] += 1
}
m.map! { |row| i = 0; row.map!{ |cell| i += cell } }
m = m.transpose.map { |column| i = 0; column.map{ |cell| i += cell } }.transpose

q = gets.to_i
q.times {
  a, b, c, d = gets.split.map(&:to_i)
  puts m[c][d] - m[a-1][d] - m[c][b-1] + m[a-1][b-1]
}
