n, m, b = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
puts (a.sum)*m + ((n*m)*b) + (c.sum)*n
