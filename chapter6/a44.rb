n, q = gets.split.map(&:to_i)
arr = Array.new(n) { |i| i+1 }
q.times do
  case gets.split.map(&:to_i)
  in [1,x,y]
    arr[x-1] = y
  in [2]
    arr.reverse!
  in [3,x]
    puts arr[x-1]
  end
end

__END__
n, q = gets.split.map(&:to_i)
arr = Array.new(n) { |i| i+1 }
reverse = false
q.times do
  case gets.split.map(&:to_i)
  in [1,x,y]
    if reverse
      arr[-x] = y
    else
      arr[x-1] = y
    end
  in [2]
    reverse = !reverse
  in [3,x]
    puts reverse ? arr[-x] : arr[x-1]
  end
end
