n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

b = a[...n/2]
c = a[n/2..]

p = [0, 1].repeated_permutation(n/2).map do |i|
  sum = 0
  (n/2).times do |j|
    sum += b[j] if i[j] == 1
  end
  sum
end
q = [0, 1].repeated_permutation(n-(n/2)).map do |i|
  sum = 0
  (n-(n/2)).times do |j|
    sum += c[j] if i[j] == 1
  end
  sum
end.sort

p.each { |i|
  x = q.bsearch { |j| j >= k-i } || q[-1]
  if i + x == k
    puts 'Yes'
    exit
  end
}
puts 'No'
