n, k = gets.split.map(&:to_i)
arr = n.times.map { gets.split.map(&:to_i) }
hp, mp = arr.transpose

hp_min, hp_max = hp.minmax
mp_min, mp_max = mp.minmax

c_arr = []
(hp_min..hp_max).each do |hp_base|
  (mp_min..mp_max).each do |mp_base|
    count = 0
    n.times do |i|
      hp, mp = arr[i]
      if hp_base <= hp && hp <= hp_base + k && mp_base <= mp && mp <= mp_base + k
        count += 1
      end
    end
    c_arr << count
  end
end
puts c_arr.max

__END__
