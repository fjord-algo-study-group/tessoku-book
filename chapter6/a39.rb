n = gets.to_i
movies = n.times.map {gets.split.map(&:to_i)}.sort_by {_2}

now = 0

puts movies.count { |l,r|
  (l >= now) ? now = r : false
}

__END__
# ary.each do
#   end_time =ary.select do |l,r|
#     now <= l  
#   end.map(&:last).min

#   if end_time
#     now = end_time
#     count += 1
#   end
# end