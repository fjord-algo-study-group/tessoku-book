n = gets.to_i
arr = gets.chomp.chars
que = []
done = []

push = -> (i) {
  colors = arr[i, 3].join
  return if i < 0 || i >= n
  return if done[i]

  if colors.count('*') + colors.count('R') == 3 || colors.count('*') + colors.count('B') == 3
    que << i
    done[i] = true
  end
}

# 最初の状態で3文字連続同じ色のやつをqueに入れる
(n-2).times { push[_1] }

# [] << 3文字連続で同じ色のindexを入れる


while res = que.shift
  arr[res, 3] = ['*', '*', '*']

  (res-2..res+2).each do |i|
    push[i]
  end
end

puts arr.all?('*') ? 'Yes' : 'No'

__END__
n = gets.to_i
arr = gets.chomp
puts arr.match?(/(B|R)\1\1/) ? 'Yes' : 'No'

__END__
0123456
BBRRRBB

que = [2]
BB***BB


BBRBRBBRRBBBRRB

BBB************
^
BBBB***********
^^
BBRRR**********
^^^

BBRBRBBRRR*****
^^^^^^^^
