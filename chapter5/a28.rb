MOD = 10000
n = gets.to_i

result = 0
n.times do |i|
  result = eval("#{result}#{gets}") % MOD
  puts result
end
