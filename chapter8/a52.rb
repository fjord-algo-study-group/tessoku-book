n = gets.to_i

queue = []
n.times do |i|
  query, name = gets.chomp.split
  case query
  when "1"
    queue << name
  when "2"
    puts queue[0]
  when "3"
    queue.shift
  end
end