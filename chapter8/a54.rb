q = gets.to_i
h = {}
q.times {
  case gets.chomp.split
  in '1', x, y
    h[x] = y
  in '2', x
    puts h[x]
  end
}
