q = gets.to_i
stack = []
q.times do
  case gets.chomp.split
  in ['1', title]
     stack << title
  in ['2']
    puts stack[-1]
  in ['3']
    stack.pop
  end
end

__END__
q = gets.to_i
arr = []
q.times do
  r, s = gets.chomp.split
  case r
  when "1"
    arr << s
  when "2"
    puts arr[-1]
  when "3"
    arr.pop
  end
end
