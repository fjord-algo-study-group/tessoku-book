n = gets.to_i
arr = gets.split.map(&:to_i) # 要素数 n-1
subs = Array.new(n, 0)
(n-1).downto(1) do |i|
  boss = arr[i-1] - 1
  subs[boss] += subs[i] + 1
end
puts subs

__END__
部下何人いるか配列
n = 7
arr = [] # 6個

[
  0, # 0
  0 + (3+1) + (1+1), # 1 - 2,3
  0+3, # 2
  0+1, # 3
  0, # 4
  0, # 5
  0, # 6
]

(n-1).downto(1) do |i|
  boss = arr[i-1] - 1
  subs[boss] += sub[i] + 1
end
