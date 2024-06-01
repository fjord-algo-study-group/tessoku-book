n = gets.to_i
l = 0
r = 47
while
  mid = (l + r) / 2.0
  res = mid**3 + mid
  if (n - res).abs <= 0.001
    puts mid 
    exit
  elsif res > n
    r = mid
  else
    l = mid
  end
end
