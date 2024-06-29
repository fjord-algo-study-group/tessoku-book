n = gets.to_i
a = gets.split.map(&:to_i)

orders = a.uniq.sort

puts a.map { |i|
  orders.bsearch_index { _1 >= i } + 1
}.join(' ')

__END__
# hash版
orders = a.sort.uniq.each_with_index.to_h
puts a.map { orders[_1].succ } * ' '
