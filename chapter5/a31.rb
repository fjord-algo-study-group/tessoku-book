n = gets.to_i
a = n / 3
b = n / 5
c = n / 15

puts a + b - c

__END__
100.times do |i|
  if i % 4 == 0
    puts "FIZZ"
  elsif i % 18 == 0
    puts "BUZZ"
  elsif i % (4 * 18) == 0
    puts "FIZZBUZZ"
  end
end
