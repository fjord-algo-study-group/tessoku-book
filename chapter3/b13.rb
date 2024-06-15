# kitarouさん作
n, k = gets.split.map(&:to_i)
ary = gets.split.map(&:to_i)

num = 0
sum = [11]
(1...n).each do |i|
    sum.push(sum[i-1]+ary[i])
end

# + ary.map {|i| num += i}

r = 0
count = 0
check = 0
(0...n).each do |l|
    while r < n
        if l > 0
            check = sum[r] - sum[l-1]
        else
            check = sum[r]
        end
        if check > k
            break
        end
        r += 1
    end
    count += r - l
    p [l,r,count]
end

__END__
7 50
11 12 16 22 27 28 31

# haruguchi作
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

i = 0
s = [i] + a.map { i += _1 }

ans = 0
r = 0
n.times do |l|
  r += 1 while  r < n && s[r+1] - s[l] <= k

  ans += r - l
end

p ans
