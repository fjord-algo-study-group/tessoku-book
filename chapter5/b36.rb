n, k = gets.split.map(&:to_i)
s = gets.chomp
puts (s.count("1") + k).even? ? 'Yes' : 'No'
