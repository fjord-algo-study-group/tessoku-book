n = gets.to_i.digits
puts n.each_with_index.sum { |d, i|
  d * 2**i
}

__END__
n = gets
puts n.to_i(2)
