n, x = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

l_index = 0
r_index = n-1

while r_index >= l_index
  mid_index = (l_index + r_index) / 2

  if a[mid_index] == x
    puts mid_index + 1
    break
  elsif a[mid_index] > x
    r_index = mid_index - 1
  elsif a[mid_index] < x
    l_index = mid_index + 1
  end
end
