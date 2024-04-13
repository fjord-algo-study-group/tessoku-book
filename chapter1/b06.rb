N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i

a = 0
s = A.inject([0]) { |result, i|
  result << a += i
}

Q.times do |i|
  l,r = gets.split.map(&:to_i)
  atari = s[r] - s[l-1]

  # (区間の日数) - あたりの数
  hazure = (r - l + 1) - atari
  calc = atari - hazure
  if calc == 0
    puts 'draw'
  elsif calc > 0
    puts 'win'
  else
    puts 'lose'
  end
end


__END__
# 三項演算子ネスト
atari == hazure ? 'draw' : atari > hazure ? 'win' : 'lose'
