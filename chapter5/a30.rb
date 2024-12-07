n, r = gets.split.map(&:to_i)
M = 1000000007

fact = Array.new(100001, 0)
fact[0] = 1
100000.times do |i|
  fact[i+1] = fact[i]*(i+1) % M
end

a = fact[n]
b = fact[r] * fact[n-r] % M
arr = [b] + [*0..29].map { b = b * b % M }
b_m = ((M-2).digits(2).size).times.inject(1) do |res, v|
  (M-2)[v] == 1 ? res * arr[v] % M : res
end
puts (a * b_m) % M
