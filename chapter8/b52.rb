n, x = gets.split.map(&:to_i) 
a = gets.chomp
q = [x]
a[x-1] = "@"

while !q.empty? do
  pos = q.shift
  if a[pos-1-1] == "."
    a[pos-1-1] = "@" 
    q << pos - 1
  end
  if a[pos-1+1] == "."
    a[pos-1+1] = "@" 
    q << pos + 1
  end
end
puts a

__END__



5 3
#@@@#

q =  