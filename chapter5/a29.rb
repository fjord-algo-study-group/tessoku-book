a, b = gets.split.map(&:to_i)
C = 10**9+7
n = a
arr = [n] + [*0..29].map { n = n * n % C }
ans = (b.digits(2).size).times.inject(1) do |res, v|
  b[v] == 1 ? res * arr[v] % C : res
end
puts ans
