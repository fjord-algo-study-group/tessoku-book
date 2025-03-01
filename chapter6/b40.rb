n = gets.to_i
arr = gets.split.map(&:to_i)
c = arr.map { _1 % 100 }.tally
p c.sum { |k,v|
  if k % 50 == 0
    v*(v-1) / 2
  else
    (c.delete(100-k) || 0) * v
  end
}

__END__
nCm = n * (n-1) * (n-m+1) / m!
nCm = nPm/m!
