n = gets.to_i

ans = []
9.downto(0) do |i|
  q = n / 2**i
  ans << q
  n -= q * (2 ** i)
end

puts ans.join


__END__
n = gets.to_i

puts n.to_s(2).rjust(10, '0')
