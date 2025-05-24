B = 100
MOD = 2147483647
n, q = gets.split.map(&:to_i)
s = gets.chomp.chars

transformation = ('a'..'z').each.with_index(1).to_h

# あらかじめ累乗のリストを作る
i = 1
b_pow = [1] + n.times.map { i = (i * B) % MOD }

# あらかじめhash値を計算しておく H[1, 1] ~ H[1, n]まで
hash = [0] * n
n.times { |i| hash[i+1] = (B * hash[i] + transformation[s[i]]) % MOD }

q.times do
  a, b, c, d = gets.split.map(&:to_i)
  ab_hash = (hash[b] - b_pow[b-a+1] * hash[a-1]) % MOD
  cd_hash = (hash[d] - b_pow[d-c+1] * hash[c-1]) % MOD

  puts ab_hash == cd_hash ? 'Yes' : 'No'
end


__END__
 123
'abc'

'abcdefg'
h[1,1] aのハッシュ値
h[1,2] abのハッシュ値
h[1,3] abcのハッシュ値
h[1,4] abcdのハッシュ値
...
h[1,7] abcdefgのハッシュ値

  l,r
s[2,3] = h[1,3] - b^2 * h[1, 1]


B=2の場合
hash = 2^(3-1)'a' + 2^(3-2)'b' + 2^(3-3)'c'
hash = 2^(3-1)*1  + 2^(3-2)*2  + 2^(3-3)*3

       hash値
1 % 3 = 1
2 % 3 = 2
3 % 3 = 0

10 % 3 = 1

文字数2, 文字種2の場合 B=2で十分そう
a or bの場合
aa 00
bb 01
ab 10
ba 11

文字数3の場合も B=2で十分そう
aaa 000
aab 001
aba 010
baa 011
abb 100
bab 101
bba 110
bbb 111

012
abc
hash = 2^2 * 2 + 2^1*1 + 2^0*2
       4         2       1

H1: S[1, 1]のハッシュ値
Hn: S[1, n]のハッシュ値

