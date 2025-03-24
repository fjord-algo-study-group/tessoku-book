n, l = gets.split.map(&:to_i)
res = 0
n.times.map do
  a, b = gets.chomp.split
  time = b == 'E' ? l - a.to_i : a.to_i
  res = [res, time].max
end
puts res

__END__
class Ant
  attr_reader :pos, :dir

  def initialize(pos, dir = true)
    @pos = pos
    @dir = dir
  end

  def move
    @pos = @dir ? pos + 0.5 : pos - 0.5
  end

  def change_dir
    @dir = !@dir
  end
end

class Tunnel
  def initialize(width)
    @width = width
  end

  def conflict(ants)
    ants.combination(2).select { |a, b| a.pos == b.pos }.flatten
  end

  def goal?(ants)
    ants.all? { |ant| ant.pos <= 0  || @width <= ant.pos }
  end
end


t = Tunnel.new(100)

ants = [
  Ant.new(20, true),
  Ant.new(50, true),
  Ant.new(70, false),
]

ans = 0
while !t.goal?(ants)
  ans += 0.5
  ants.map(&:move)
  t.conflict(ants).each(&:change_dir)
end

p ans.to_i
