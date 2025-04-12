s = gets.chomp
stack = []
(s.size).times do |i|
  if s[i] == '('
    stack << i+1
  else
    puts "#{stack.pop} #{i+1}"
  end
end
