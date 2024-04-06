n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

answer = false

(1 << n).times do |i|
  # iは0から
  sum = 0
  
  # (1..n).each do |j|
  #   if (n / (1 << (j-1))) % 2 == 1
  #     sum += a[j-1]
  #   end
  # end
  p i.to_s(2).rjust(3, '0')
  n.times do |j|
    # Intger#[]
    sum += a[j] if i[j] == 1
    # 324[0] = 4
    # 324[1] = 2
    # 324[2] = 3
  end
  
  break answer = true if sum == k
end

puts answer ? 'Yes' : 'No'

__END__
(n / (1 << (j-1))) % 2

入力例)
3 20
5 8 9

2**n → 1 << n
(1<<n).times ...
0001 << 3
1000  2 * 2 * 2 = 2 ** 3

1000 >> 3
0001
8 >> 3 = 1

1 << 3 = 8

i) 1 << 3 の例
001
010
011
100
101
110
111

(n / (1 << (j-1))) % 2

(324 / 1 ) % 10 = 4
324 / 1 << 0

(324 / 10) % 10 = 2
324 / 1 << 1

(324 / 100) % 10 = 3
324 / 1 << 2 % 2

1101 >> 3 → 1 & 1 = 1
1101 >> 1 → 110 & 1 = 0

  110
& 001
------
  000 
