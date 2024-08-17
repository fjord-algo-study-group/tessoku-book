n = gets.to_i
s = gets.chomp

dp = Array.new(n+1){Array.new(n+1){0}}

n.times do |i|
  dp[i][i] = 1
end

(0...n-1).each do |i|
  if(s[i] == s[i+1])
    dp[i][i+1] =2
  else
    dp[i][i+1] =1
  end
end

(2..n-1).each do |len|
  (0...n-len).each do |l|
    r = l + len
    
    if s[l] == s[r]
      dp[l][r] = [dp[l][r-1], dp[l+1][r], dp[l+1][r-1]+2].max
    else
      dp[l][r] = [dp[l][r-1], dp[l+1][r]].max
    end
    # p [l,r,len,n,s[l..r]]
  end
end

p dp[0][n-1]

__END__
11
programming
