n = gets.to_i

def pie(n, *nums)
  size = nums.size
  
  size.times.sum do |i|
    res = nums.combination(i + 1).sum do |ary|
      n / ary.inject(&:lcm)
    end
    i % 2 == 0 ? res : -res
  end
end

ary = (1..20)
puts pie(n,*ary)

__END__
x = 3
y = 5
z = 7

# # それぞれの範囲
# a = n / x
# b = n / y
# c = n / z

# # 6 20
# # 1,2,3,6
# # 1,2,4,5,10,20
# # a *  b = gcd * lcm

# # 重なりが偶数
# ab = n / x.lcm(y)
# bc = n / y.lcm(z)
# ac = n / x.lcm(z)

# # 重なりが奇数
# abc = n / x.lcm(y).lcm(z)

# puts a + b + c  - ab - bc - ac + abc