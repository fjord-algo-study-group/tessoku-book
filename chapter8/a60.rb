n = gets.to_i
arr = gets.split.map(&:to_i)
stack = []

n.times do |i|
  while !stack.empty? && (stack[-1].last < arr[i])
    stack.pop
  end

  puts stack.empty? ? -1 : stack[-1][0]
  stack << [i+1, arr[i]]
end
