n = gets.to_i
hash = Hash.new(0)
n.times { hash[gets.to_i] += 1 }
puts hash.values.sum { _1*(_1-1) / 2 }

__END__
# これも間に合ってしまった
puts hash.values.sum { Array.new(_1).combination(2).size }
