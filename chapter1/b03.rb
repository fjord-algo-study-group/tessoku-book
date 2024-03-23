n = gets.to_i
a = gets.split.map(&:to_i)
flg = false
(0...n).each do |i|
  (i+1...n).each do |j|
    (j+1...n).each do |k|
      flg = true if a[i] + a[j] + a[k] == 1000
    end
  end
end

puts flg ? 'Yes' : 'No'


__END__
puts [*0...n].combination(3).any? { |i, j, k| a[i] + a[j] + a[k] == 1000 } ? 'Yes' : 'No'
