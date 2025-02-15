n, k = gets.split.map(&:to_i)
puts (k < (n-1)*2 || k.odd?) ? 'No' : 'Yes'
