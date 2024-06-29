n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
d = gets.split.map(&:to_i)

p = a.product(b).map(&:sum).sort
q = c.product(d).map(&:sum).sort

p.each { |i|
  x = q.bsearch { |j| j >= k-i } || q[-1]
  if i + x == k
    puts 'Yes'
    exit
  end
}
puts 'No'
