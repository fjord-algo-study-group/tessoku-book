n = gets.to_i
a = gets.split.map(&:to_i).sort
q = gets.to_i
x = q.times.map{ gets.to_i }
x.each { |i|
  puts a.bsearch_index { |j| i <= j } || n
}
